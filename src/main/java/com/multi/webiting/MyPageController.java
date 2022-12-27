package com.multi.webiting;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.model.PagingVO;
import com.common.CommonUtil;
import com.user.model.LikeprodVO;
import com.user.service.MyPageService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user/mypage")
@Log4j
public class MyPageController {
	
	@Inject
	@Qualifier(value="MyPageServiceImpl")
	private MyPageService mService;
	
	CommonUtil common = new CommonUtil();
	
	@GetMapping("/likeList")
	public String likeList(Model m, @ModelAttribute("page") PagingVO page, HttpServletRequest req) {
		HttpSession ses=req.getSession();
		
		log.info("1 page==="+page);
		int totalCount=this.mService.getTotalCount(page);
		page.setTotalCount(totalCount);
		page.setPageSize(10);
		page.setPagingBlock(5);
		
		page.init(ses);
		
		log.info("2 page==="+page);
		
		List<LikeprodVO> likeArr=this.mService.selectLikeAllPaging(page);
		
		m.addAttribute("paging", page);
		m.addAttribute("likeArr", likeArr);
		return "mypage/likelist";
		
	}
	
	@PostMapping("/delete")
	public String likeDelete(Model m, @RequestParam(defaultValue="0") int pnum) {
		log.info("pnum==="+pnum);
		if(pnum==0) {
			return "redirect:likeList";
		}
		
		int n=mService.deleteLikeProd(pnum);
		
		String str=(n>0)?"삭제 되었습니다.":"관심 상품 삭제 실패";
		String loc=(n>0)?"likeList":"javascript:history.back()";
		
		return common.addMsgLoc(m, str, loc);
	}
}
