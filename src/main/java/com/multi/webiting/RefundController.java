package com.multi.webiting;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class RefundController {
	
	@GetMapping("/refundRequest/{ordered_no}")
	public String refundRequest(Model m, @PathVariable("ordered_no") String ordered_no) {
		log.info("ordered_no==="+ordered_no);
		m.addAttribute("ordered_no", ordered_no);
		return "mypage/refundReq";
	}
	
	@GetMapping("refundEnd/{ordered_no}")
	public String refundEnd(Model m, @PathVariable("ordered_no") String ordered_no) {
		m.addAttribute("ordered_no", ordered_no);
		return "mypage/refundEnd";
	}

}
