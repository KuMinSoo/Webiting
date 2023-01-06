package com.multi.webiting;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {
	
	@GetMapping("/reviewForm")
	public String reviewForm() {
		
		return "review/reviewForm";
	}
	
}
