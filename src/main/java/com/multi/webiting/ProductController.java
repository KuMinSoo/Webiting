package com.multi.webiting;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.product.model.ProductVO;
import com.product.service.ShopService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ProductController {
	
	@Inject
	private ShopService shopService;

	//pspec(HIT,NEW,BEST) ���� ��ǰ��� ��������
	@GetMapping("/prodPspec")
	public String productByPspec(Model m, @RequestParam(name="pspec", defaultValue="HIT") String pspec) {
		log.info("pspec==="+pspec);
		
		List<ProductVO> pList=shopService.selectByPspec(pspec);
		
		m.addAttribute("pList",pList);
		
		return "shop/mallHit";
	}//-------------------------------------
	/*@GetMapping("/prodDetail")
	public String productDetail(Model m, @RequestParam(defaultValue="0") int pnum, HttpSession ses) {
		if(pnum==0) {
			return "redirect:index";
		}
		ses.setAttribute("pnum", pnum);
		ProductVO vo=this.shopService.selectByPnum(pnum);
		m.addAttribute("prod",vo);
		return "shop/prodDetail";
	}//-------------------------------------*/
	
}