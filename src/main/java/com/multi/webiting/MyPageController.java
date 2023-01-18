package com.multi.webiting;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.model.PagingVO;
import com.common.CommonUtil;
import com.product.model.CartVO;
import com.product.model.OrderedVO;
import com.product.model.ProductVO;
import com.product.service.OrderedService;
import com.product.service.ShopService;
import com.user.model.DitchVO;
import com.user.model.IpayVO;
import com.user.model.LikeVO;
import com.user.model.UserVO;
import com.user.service.MyPageService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage")
@Log4j
public class MyPageController {
	
	@Inject 
	@Qualifier(value="MyPageServiceImpl")
	private MyPageService mService;
		
	@Inject
	@Qualifier(value="ShopServiceImpl")
	private ShopService sService;
	
	@Inject
	@Qualifier(value="orderedServiceImpl")
	private OrderedService oService;
	
	CommonUtil common = new CommonUtil();
	
	@PostMapping("/addLikeProd")
	public String addLikePord(Model m, @ModelAttribute LikeVO like) {
		
		//LikeVO like=new LikeVO();
		int n=mService.insertLikeProd(like);
		log.info(like);
		String str=(n>0)?"추가 되었습니다.":"관심 상품 추가 실패";
		
		String loc=(n>0)?"likeList":"javascript:history.back()";
		
		return common.addMsgLoc(m, str, loc);
	}
	
	@PostMapping(value="/addLikePorductFromDetail",produces="application/json")
	@ResponseBody
	public void addLikePorductFromDetail(@RequestBody LikeVO like) {
		log.info(like);
		if(like.getLikeval()==1) {
			int n=mService.insertLikeProd(like);
			log.info("삽입 성공=="+n);
		}
		else {
			int n=mService.deleteLike(like);	
			log.info("삭제 성공=="+n);
		}
		
	}
	@GetMapping("/likeList")
	public String likeList(Model m, @ModelAttribute("page") PagingVO page, HttpServletRequest req,
			HttpSession session, @RequestHeader("User-Agent") String userAgent) {
		String myctx=req.getContextPath();
		HttpSession ses=req.getSession();
		
		log.info("1 page==="+page);
		int totalCount=this.mService.getTotalCount(page);
		page.setTotalCount(totalCount);
		page.setPageSize(10);
		page.setPagingBlock(5);
		page.init(ses);
		
		UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
		int idx=loginUser.getIdx();
		page.setIdx(idx);
		
		page.init(ses);
		
		log.info("2 page==="+page);
		
		List<LikeVO> likeArr=this.mService.selectLikeAllPaging(page);
		String loc="mypage/likeList";
		String pageNavi=page.getPageNavi(myctx, loc, userAgent);
		log.info("likeArr=="+likeArr);
		m.addAttribute("pageNavi", pageNavi);
		m.addAttribute("paging", page);
		m.addAttribute("likeArr", likeArr);
		return "mypage/likelist";
		
	}
	
	@PostMapping("/like_del")
	public String likeDelete(Model m, @ModelAttribute LikeVO like) {
		log.info("LikeprodVO==="+like);
		if(like==null) {
			return "redirect:likeList";
		}
		
		int n=mService.deleteLike(like);
		
		
		String str=(n>0)?"삭제 되었습니다.":"관심 상품 삭제 실패";
		String loc=(n>0)?"likeList":"javascript:history.back()";
		log.info(str);
		return common.addMsgLoc(m, str, loc);
	}
	
	
	@PostMapping("/select_del")
	public String selectDelete(Model m, @RequestParam("pnum") String str, @RequestParam("idx") Integer idx) {
		log.info("str/idx==="+str+"/"+idx);
		
		String[] pnum=str.split(",");
		LikeVO vo=new LikeVO();
		vo.setIdx(idx);
		//Integer.parseInt(num)
		for(int i=0; i<pnum.length; i++) {
			vo.setPnum(Integer.parseInt(pnum[i]));			
			mService.deleteLike(vo);
		}
		
		return "redirect:likeList";
	}
	
	@PostMapping("/move_cart")
	public String moveCart(Model m, @RequestParam("pnum") String str, @RequestParam("idx") Integer idx) {
		log.info("str/idx==="+str+"/"+idx);
		
		String[] pnum=str.split(",");
		CartVO vo=new CartVO();
		vo.setIdx_fk(idx);
		
		int n=-999;
		String str2="";
		String loc="";
		
		for(int i=0; i<pnum.length; i++) {
			vo.setPnum_fk(Integer.parseInt(pnum[i]));			
			n=mService.moveCart(vo);
			if(n<0) {
				str2="장바구니 추가 실패";
				loc="javascript:history.back()";
			}
		}
		
		str2="해당 상품을 장바구니로 이동하였습니다.";
		loc="cartList";
		
		return common.addMsgLoc(m, str2, loc);
	}
	
	@GetMapping("/cartList")
	public String cartList(Model m, HttpSession session) {		
		
		UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
		int idx_fk=loginUser.getIdx();
		
		List<CartVO> cartArr=mService.selectCartView(idx_fk);
		CartVO cartVo=mService.getCartTotal(idx_fk);
		
		m.addAttribute("cartArr",cartArr);
		m.addAttribute("cartTotal",cartVo);
		
		return "mypage/cartlist";
	}
	
	@PostMapping("/cartDel")
	public String cartDelete(@RequestParam(defaultValue="0") int cartNum) {
		if(cartNum==0) {
			return "redirect:cartList";
		}
		int n=mService.delCart(cartNum);
		return "redirect:cartList";
	}//-----------------------------------
	
	@PostMapping("/cartEdit")
	public String cartEdit(@ModelAttribute("cvo") CartVO cvo) {
		log.info("cvo==="+cvo);
		
		mService.editCart(cvo);
		
		return "redirect:cartList";
	}
	
	@PostMapping("/order")
	public String goOrder(Model m, @RequestParam("pnum") String[] pnum,
			@RequestParam("oqty") int[] oqty, @RequestParam("idx") Integer idx,
			HttpSession session) {
		
		List<ProductVO> orderList=new ArrayList<>();
		int totalPrice=0,totalPoint=0; 
		OrderedVO ovo=new OrderedVO();
		for(int i=0; i<pnum.length; i++) {
			//상품정보
			ProductVO prod=sService.selectByPnum(Integer.parseInt(pnum[i]));
			prod.setPqty(oqty[i]);//주문수량으로 설정
			orderList.add(prod);
			totalPrice+=prod.getTotalPrice();
			totalPoint+=prod.getTotalPoint();
		}
		log.info("ovo==="+ovo);
		
		ovo.setTotalPrice(totalPrice);
		ovo.setTotalPoint(totalPoint);
		session.setAttribute("orderList", orderList);//상품목록
		session.setAttribute("ovo", ovo);//주문목록

		return "mypage/order";
	}
	
	@PostMapping("/orderEnd")
	public String orderEnd(Model m, HttpSession session, @ModelAttribute IpayVO ivo) {
		log.info("ivo==="+ivo);
		int merchant_uid=1;
		ivo.setMerchant_uid(merchant_uid);
		log.info("ivo==="+ivo);
		
		
		return "mypage/orderEnd";
	}
	
	@GetMapping("/userOrdered")
	public String userOrdered(Model m, HttpSession session) {
		
		UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
		int idx_fk=loginUser.getIdx();
		
		List<OrderedVO> olist=oService.selectOrderedByidx(idx_fk);
		List<OrderedVO> rlist=oService.selectRefundByidx(idx_fk);
		
		m.addAttribute("orderedList", olist);
		m.addAttribute("refundList", rlist);
		return "mypage/userOrdered";
	}
	
	@PostMapping("/userOrderedDetail")
	public String userOrderedDetail(Model m, @RequestParam("ordered_no") String ordered_no, HttpSession session) {
		//log.info(ordered_no);
		UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
		int idx_fk=loginUser.getIdx();
		
		OrderedVO ovo=new OrderedVO();
		ovo.setIdx_fk(idx_fk);
		ovo.setOrdered_no(ordered_no);
		
		List<OrderedVO> olist=oService.selectOrderedByOnum(ovo);
		List<OrderedVO> dlist=oService.selectOrdered(ovo);
		List<OrderedVO> ylist=oService.selectYetRefund(ovo);
		
		m.addAttribute("orderedList", olist);
		m.addAttribute("detailList", dlist);
		m.addAttribute("yetrefundList", ylist);
		
		return "mypage/userOrderedDetail";
	}

	@GetMapping("/ditchProdList")
	public String ditchProdList(Model m,HttpSession ses) {
		UserVO vo=(UserVO)ses.getAttribute("loginUser");
		int idx=vo.getIdx();
		List<DitchVO> list=mService.ditchProdList(idx);
		m.addAttribute("ditchList",list);
		return "mypage/ditchProdList";
	}
	@GetMapping("/ditchProd")
	public String ditchProd(Model m) {
		
		return "mypage/ditchProd";
	}
	@PostMapping("/ditchEnd")
	public String ditchEnd(Model m,@ModelAttribute DitchVO vo) {
		//log.info(vo);
		int n=mService.insertDitchProduct(vo);
		if(n>0) {
			return common.addMsgLoc(m, "폐가구 수거신청 완료", "ditchProdList");
		}
		return common.addMsgBack(m,"폐가구 수거신청 실패");
	}
	@GetMapping(value="ditchDel/{dnum}")
	public String ditchDel(Model m,@PathVariable(name = "dnum") int dnum){
		int n=mService.deleteDitch(dnum);
		if(n>0) {
			return common.addMsgLoc(m, "폐가구 수거삭제 완료", "/mypage/ditchProdList");
		}
		return common.addMsgBack(m,"폐가구 수거삭제 실패");
	}

	
	@PostMapping("/refundReq")
	public String refundReq(Model m, @RequestParam("rfType") int rfType, @RequestParam("rtxt") String rtxt, @RequestParam("orderedNum") int[] orderedNum) {
		log.info(rfType+"/"+rtxt+"/"+orderedNum);
		int n=-999;
		for(int i=0; i<orderedNum.length; i++) {
			OrderedVO ovo=oService.selectOrderedByorderedNum(orderedNum[i]);
			ovo.setRefund_num_fk(rfType);
			ovo.setRtxt(rtxt);
			n=oService.updateRefund(ovo);
		}
		
		String str=(n>0)?"취소/환불 신청을 완료하였습니다.":"취소/환불 신청에 실패했습니다.";
		String loc=(n>0)?"userOrdered":"javascript:history.back()";

		return common.addMsgLoc(m, str, loc);

	}
}
