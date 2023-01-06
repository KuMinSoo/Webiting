package com.multi.webiting;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.CommonUtil;
import com.product.model.OrderedVO;
import com.product.service.OrderedService;
import com.user.model.UserVO;



@Controller
@RequestMapping
public class AdminOrderedController {

	@Autowired
	@Qualifier(value="orderedServiceImpl")
	OrderedService orderedService;
	
	@Autowired
	CommonUtil Util;
	
	
	@PostMapping(value="/orderedInsert",produces="application/json")
	@ResponseBody
	public OrderedVO orderedInsert(OrderedVO vo,HttpSession ses) {
		
		UserVO user=(UserVO)ses.getAttribute("loginUser");
		vo.setIdx_fk(user.getIdx());
		vo.setUserid(user.getUserid());
				
		return vo;
	}
	
	@GetMapping("adminOrdered/orderedList")
	public void orderedList(Model m, HttpSession ses) {
		
	}
	
	@PostMapping("/delivCompleted")
	public int delivCompleted(int orderedDetail_no) {
		
		return this.orderedService.updateDelivCompleted(orderedDetail_no);
		
	}
	
	
	@GetMapping("adminOrdered/orderedDetailList")
	public void orderedDetailList(Model m, HttpSession ses) {
		//주문하기 vo가 리스트로 간다.. 
	}
	
	@PostMapping("/orderedDelivnum")
	public String orderedDelivnum(String ordered_delivnum, int orderedDetail_no,Model m) {
		
		int n=this.orderedService.updateOrderDetailDelivnum(ordered_delivnum,orderedDetail_no);
		
		String msg="송장번호 업데이트";
		msg=n>0?"성공":"실패"; 
		String loc=n>0?"adminOrdered/orderedDetailList":"javascript:history.back()";
		
		return Util.addMsgLoc(m, msg, loc);
	}
	
}
