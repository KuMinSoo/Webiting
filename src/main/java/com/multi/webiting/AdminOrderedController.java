package com.multi.webiting;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.CommonUtil;
import com.product.model.OrderVO;
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
	@Qualifier(value="orderedServiceImpl")
	OrderedService orderedService;
	
	@Autowired
	CommonUtil Util;
	
	
	@SuppressWarnings("null")
	@PostMapping(value="/orderedInsert",produces="application/json")
	@ResponseBody
	public OrderedVO orderedInsert(@RequestBody OrderedVO vo,HttpSession session) {
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
		for(ProductVO prodVO: orderList) {
			//값저장......	
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
			log.info(n+"번재 입력된 vo===========>"+vo);
			n++;
		}
		
		return vo;
	}
	
	

	
	@GetMapping("/AorderedList")
	public String orderedList(Model m, HttpSession ses,
			OrderedVO vo) {
		log.info("주문항목========================>"+vo);
		
		List<OrderedVO> orderList=this.orderedService.selectAll();
		
		m.addAttribute("orderList",orderList);
		
		return "adminOrdered/orderedDetailList";
		
		
		
		
	}
	
	@PostMapping("/delivCompleted")
	public int delivCompleted(int orderedNum) {
		
		return this.orderedService.updateDelivCompleted(orderedNum);
		
	}
	
	
	
	@PostMapping(value = "/updatedelivnum",produces="application/json")
	@ResponseBody
	public String orderedDelivnum(String ordered_delivnum, int orderedNum, Model m) {
		
		
		int n=this.orderedService.updateDelivnum(ordered_delivnum,orderedNum);
		
	
		return null;
	}
	
}
