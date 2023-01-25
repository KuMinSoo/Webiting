package com.multi.webiting;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/top")
	public String top() {
		return "/top";
	}
	
	/*@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home() {
				
		return "/index";
	}*/
	@RequestMapping("/header")
	public String header() {
		return "/header";
	}
	
	@RequestMapping("/foot")
	public String foot() {
		return "/foot";
	}
	
	//prodDetail 상단 참조	
	@RequestMapping("/dtop")
	public String dtop() {
		return "/dtop";
	}
	
	@RequestMapping("/mypageNavi")
	public String mypageNavi() {
		return "/mypageNavi";
	}
	
	@RequestMapping("/agree")
	public String agree() {
		return "/agree";
	}
	

	@GetMapping("/admin/chart")
	public String chart() {
		return "admin/stats";
	}
	
	@RequestMapping("/mypage/userStats")
	public String userStats() {
		return "/mypage/userStats";
	}	

	@RequestMapping("adminTop")
	public void adminTop() {
		
	}
	@RequestMapping("adminNavi")
	public void adminNavi() {
		

	}
}
