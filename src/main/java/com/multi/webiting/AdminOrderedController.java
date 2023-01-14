package com.multi.webiting;

import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.model.PagingVO;
import com.common.CommonUtil;
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
		log.info("js에서 받은 vo ====================>" + vo);
		// 값비교후 참일떄
		List<ProductVO> orderList = (List<ProductVO>) session.getAttribute("orderList");

		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		int n = 1;
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
		log.info("주문항목========================>" + vo);
		log.info(page);
		log.info("orderMode========================>" + page.getOrderMode());
		log.info("orderStatusMode========================>" + page.getOrderStatusMode());

		String myctx = req.getContextPath();
		HttpSession ses = req.getSession();
		
		int totalCount = this.orderedService.getTotalCount(page);////문제
		page.setTotalCount(totalCount);
		page.setPagingBlock(5);
		page.init(ses);
		String loc = "orderedCancel";
		String pageNavi = page.getPageNavi(myctx, loc, userAgent);// 페이징 블럭 처리 함수

		List<OrderedVO> orderList = this.orderedService.selectCancelList(page);

		m.addAttribute("orderList", orderList);
		m.addAttribute("pageNavi", pageNavi);
		m.addAttribute("paging", page);

		return "adminOrdered/orderedCancel";
	}
	
	@GetMapping("/AorderedList")
	public String orderedList(Model m, PagingVO page, HttpServletRequest req,
			@RequestHeader("User-Agent") String userAgent, OrderedVO vo) {
		log.info("주문항목========================>" + vo);
		log.info(page);
		log.info("orderMode========================>" + page.getOrderMode());
		log.info("orderStatusMode========================>" + page.getOrderStatusMode());

		String myctx = req.getContextPath();
		HttpSession ses = req.getSession();
		
		int totalCount = this.orderedService.getTotalCount(page);////문제
		page.setTotalCount(totalCount);
		page.setPagingBlock(5);
		page.init(ses);
		String loc = "AorderedList";
		String pageNavi = page.getPageNavi(myctx, loc, userAgent);// 페이징 블럭 처리 함수

		List<OrderedVO> orderList = this.orderedService.selectOrderedAllPaging(page);

		m.addAttribute("orderList", orderList);
		m.addAttribute("pageNavi", pageNavi);
		m.addAttribute("paging", page);

		return "adminOrdered/orderedDetailList";

	}
	
	@PostMapping("/AorderedList")
	public String orderedList1(Model m, PagingVO page, HttpServletRequest req,
			@RequestHeader("User-Agent") String userAgent,@ModelAttribute("vo") OrderedVO vo,BindingResult b) {
		log.info("주문항목========================>" + vo);
		log.info("orderMode========================>" + page.getOrderMode());
//b.getFieldError();
		String myctx = req.getContextPath();
		HttpSession ses = req.getSession();
		
		int totalCount = this.orderedService.getTotalCount(page);////문제
		page.setTotalCount(totalCount);
		page.setPagingBlock(5);
		page.init(ses);
		String loc = "AorderedList";
		String pageNavi = page.getPageNavi(myctx, loc, userAgent);// 페이징 블럭 처리 함수

		List<OrderedVO> orderList = this.orderedService.selectOrderedAllPaging(page);

		m.addAttribute("orderList", orderList);
		m.addAttribute("pageNavi", pageNavi);
		m.addAttribute("paging", page);

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
