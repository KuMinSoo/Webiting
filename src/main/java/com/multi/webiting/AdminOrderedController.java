package com.multi.webiting;

import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.model.PagingVO;
import com.common.CommonUtil;
import com.product.model.OrderVO;
import com.product.model.DateVO;
import com.product.model.OrderedVO;
import com.product.model.ProductVO;
import com.product.service.OrderedService;
import com.user.model.UserVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping
@Log4j
public class AdminOrderedController {

	@Autowired
	@Qualifier(value = "orderedServiceImpl")
	OrderedService orderedService;

	@Autowired
	CommonUtil Util;


	@PostMapping(value = "/orderedInsert",produces="application/json")
	@ResponseBody
	public OrderedVO orderedInsert(@RequestBody OrderedVO vo, HttpSession session) {
		log.info("js에서 받은 vo ====================>"+vo);
		UserVO loginUser=(UserVO) session.getAttribute("loginUser");
		/////////////////////////////////////////////////
		//결제정보만 얻어오기
		OrderVO ovo = new OrderVO();

		ovo.setTitle(vo.getTitle());
		ovo.setOrdered_no(vo.getOrdered_no());
		ovo.setOrdered_orderprice(vo.getOrdered_orderprice());
		ovo.setOrdered_payhow(vo.getOrdered_payhow());
		ovo.setOrdered_paystate(vo.getOrdered_paystate());
		ovo.setOrdered_to_adr(vo.getOrdered_to_adr());
		ovo.setOrdered_to_email(vo.getOrdered_to_email());
		ovo.setOrdered_to_name(vo.getOrdered_to_name());
		ovo.setOrdered_to_post(vo.getOrdered_to_post());
		ovo.setOrdered_to_tel(vo.getOrdered_to_tel());
		ovo.setIdx(loginUser.getIdx());
		this.orderedService.insertOrder(ovo);
		/////////////////////////////////////////////////
		//값비교후 참일떄
		List<ProductVO> orderList=(List<ProductVO>) session.getAttribute("orderList");
		log.info("sssssssssssssssssssssssss"+orderList.get(0).getPnum());
		int n=1;
		for (ProductVO prodVO : orderList) {
			// 값저장......
			vo.setPnum_fk(prodVO.getPnum());
			vo.setPname(prodVO.getPname());
			vo.setOqty(prodVO.getPqty());
			vo.setPrice(prodVO.getPrice());
			vo.setSaleprice(prodVO.getSaleprice());
			vo.setPimage(prodVO.getPimage1());
			vo.setPcompany(prodVO.getPcompany());
			vo.setTotalPoint(prodVO.getTotalPoint());
			vo.setTotalPrice(prodVO.getTotalPrice());
			vo.setIdx_fk(loginUser.getIdx());
			this.orderedService.insertOrdered(vo);
			log.info(n + "번재 입력된 vo===========>" + vo);
			n++;
		}

		return vo;
	}
	
	 @GetMapping("/orderedCancel")
	   public String orderedCancel(Model m, PagingVO page, HttpServletRequest req,
	         @RequestHeader("User-Agent") String userAgent, OrderedVO vo) {

	      String myctx = req.getContextPath();
	      HttpSession ses = req.getSession();
	      log.info("page1==================>"+page);
	      if(page.getOrderStatusMode()==null) {
	         page.setOrderStatusMode("3");
	      }
	      int totalCount = this.orderedService.getCancelCount(page);////문제
	      log.info("page2==================>"+page);
	      page.setTotalCount(totalCount);
	      page.setPagingBlock(5);
	      page.init(ses);
	      
	      String loc = "orderedCancel";
	      String pageNavi = page.getPageNavi(myctx, loc, userAgent);// 페이징 블럭 처리 함수
	      log.info("page3==================>"+page);
	      List<OrderedVO> orderList = this.orderedService.selectCancelList(page);
	      DateVO dateMap=new DateVO();
	      dateMap.CalDate();

	      m.addAttribute("orderList", orderList);
	      m.addAttribute("pageNavi", pageNavi);
	      m.addAttribute("paging", page);
	      m.addAttribute("dateMap", dateMap);
	      log.info("page4==================>"+page);
	      return "adminOrdered/orderedCancel";

	   }
	   
	   @GetMapping("/AorderedList")
	   public String orderedList(Model m,@ModelAttribute PagingVO page, HttpServletRequest req,
	         @RequestHeader("User-Agent") String userAgent, OrderedVO vo) {

	      String myctx = req.getContextPath();
	      HttpSession ses = req.getSession();
	      int totalCount = this.orderedService.getTotalCount(page);////문제
	      page.setTotalCount(totalCount);
	      page.setPagingBlock(5);
	      page.init(ses);
	      String loc = "AorderedList";
	      String pageNavi = page.getPageNavi(myctx, loc, userAgent);// 페이징 블럭 처리 함수
	   
	      List<OrderedVO> orderList = this.orderedService.selectOrderedAllPaging(page);

	      DateVO dateMap=new DateVO();
	      dateMap.CalDate();

	      m.addAttribute("orderList", orderList);
	      m.addAttribute("pageNavi", pageNavi);
	      m.addAttribute("paging", page);
	      m.addAttribute("dateMap", dateMap);


	      return "adminOrdered/orderedDetailList";

	   }
	   
	   @PostMapping("/delivStart")
	   public String delivCompleted(int orderedNum, int mode, Model m,PagingVO page) {
	      log.info("-----------------orderedNum: " + orderedNum);
	      log.info("-----------------mode: " + mode);
	      int n = 0;
	      String str = "";
	      String list= "AorderedList?pageSize="+page.getPageSize()+"&orderMode="+page.getOrderMode();
	      if (mode == 1) {
	         n = this.orderedService.updateDelivStart(orderedNum);// 배송대기일때
	         str = "배송을 시작했습니다";
	      } else if (mode == 2) {
	         n = this.orderedService.updateDelivCompleted(orderedNum);// 배송중일때
	         str = "배송이 완료됬습니다";
	      } else if (mode == 3) {
	         n = this.orderedService.updateCancelCompleted(orderedNum);// 취소처리
	         str = "취소환불 되었습니다";
	         list="orderedCancel?pageSize="+page.getPageSize()+"&orderMode="+page.getOrderMode();
	      } 

	      String loc = n > 0 ? list : "javascript:history.back()";
	      String msg = n > 0 ? str : "설정이 되지 않았습니다";

	      return Util.addMsgLoc(m, msg, loc);

	   }

}
