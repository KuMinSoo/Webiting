package com.multi.webiting;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.CommonUtil;
import com.product.model.OrderVO;
import com.product.model.OrderedDetailVO;
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
	
	
	@PostMapping(value="/orderedInsert",produces="application/json")
	@ResponseBody
	public OrderedVO orderedInsert(@RequestBody OrderedVO vo,HttpSession session) {
		log.info("js에서 받은 vo ====================>"+vo);
		//값비교후 참일떄
		List<ProductVO> orderList=(List<ProductVO>) session.getAttribute("orderList");
		log.info("sssssssssssssssssssssssss"+orderList.get(0).getPnum());
		UserVO loginUser=(UserVO) session.getAttribute("loginUser");
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
			vo.setOnum(prodVO.getOnum());
			vo.setIdx_fk(loginUser.getIdx());
			vo.setUserid(loginUser.getUserid());
			this.orderedService.insertOrdered(vo);
			log.info(n+"번재 입력된 vo===========>"+vo);
			n++;
		}
		
		return vo;
	}
	
	

	
	@GetMapping("adminOrdered/orderedList")
	public void orderedList(Model m, HttpSession ses,
			OrderedVO vo, OrderedDetailVO dVO) {
		log.info("주문항목========================>"+vo);
		
		
		
		
		
		
	}
	
	@PostMapping("/delivCompleted")
	public int delivCompleted(int orderedDetail_no) {
		
		return this.orderedService.updateDelivCompleted(orderedDetail_no);
		
	}
	
	
	@GetMapping("adminOrdered/orderedDetailList")
	public void orderedDetailList(Model m, HttpSession ses) {
		
	}
	
	@PostMapping("/orderedDelivnum")
	public String orderedDelivnum(String ordered_delivnum, int orderedDetail_no,Model m) {
		
		int n=this.orderedService.updateOrderDetailDelivnum(ordered_delivnum,orderedDetail_no);
		
		String msg="송장번호 입력";
		msg=n>0?"성공":"실패"; 
		String loc=n>0?"adminOrdered/orderedDetailList":"javascript:history.back()";
		
		return Util.addMsgLoc(m, msg, loc);
	}
	
}
