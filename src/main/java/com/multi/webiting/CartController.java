package com.multi.webiting;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.product.model.CartVO;
import com.product.service.ShopService;
import com.user.model.UserVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user")
@Log4j
public class CartController {
	
	@Autowired
	@Qualifier(value = "ShopServiceImpl")
	private ShopService shopService;
	
	@PostMapping("/cartAdd")
	public String addCart(
			Model m, HttpSession session,
			@RequestParam(defaultValue="0") int pnum,
			@RequestParam(defaultValue="0") int oqty) {
		log.info("pnum==="+pnum+", oqty==="+oqty);
		if(pnum==0||oqty==0) {
			 return "redirect:../index";
		}
		
		UserVO loginUser=(UserVO)session.getAttribute("loginUser");
		int idx_fk=loginUser.getIdx();
		
		CartVO cvo=new CartVO();
		cvo.setPnum_fk(pnum);
		cvo.setOqty(oqty);
		cvo.setIdx_fk(idx_fk);
		
		int n=this.shopService.addCart(cvo);
		
		return "redirect:cartList";
	}
	
	@GetMapping("/cartList")
	public String cartList(Model m, HttpSession session) {
		
		UserVO loginUser=(UserVO)session.getAttribute("loginUser");
		int idx_fk=loginUser.getIdx();
		
		List<CartVO> cartArr=this.shopService.selectCartView(idx_fk);
		//Ư�� ȸ���� ��ٱ��� �Ѿ� ��������
		CartVO cartVo=this.shopService.getCartTotal(idx_fk);
		
		m.addAttribute("cartArr",cartArr);
		m.addAttribute("cartTotal",cartVo);
		
		return "shop/cartList";
	}//--------------------------------
	
	@PostMapping("/cartDel")
	public String cartDelete(@RequestParam(defaultValue="0") int cartNum) {
		if(cartNum==0) {
			return "redirect:cartList";
		}
		int n=shopService.delCart(cartNum);
		return "redirect:cartList";
	}//-----------------------------------
	
	@PostMapping("/cartEdit")
	public String cartEdit(@ModelAttribute("cvo") CartVO cvo) {
		log.info("cvo==="+cvo);
		
		shopService.editCart(cvo);
		
		return "redirect:cartList";
	}//-----------------------------------

}/////////////////////////////////////


