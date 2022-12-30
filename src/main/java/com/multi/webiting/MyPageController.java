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
import com.user.model.LikeVO;
import com.user.service.MyPageService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage")
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
		
		List<LikeVO> likeArr=this.mService.selectLikeAllPaging(page);
		
		m.addAttribute("paging", page);
		m.addAttribute("likeArr", likeArr);
		return "mypage/likelist";
		
	}
	
	@PostMapping("/like_del")
	public String likeDelete(Model m, @ModelAttribute LikeVO like) {
		log.info("LikeprodVO==="+like);
		if(like==null) {
			return "redirect:likeList";
		}
		
		int n=mService.deleteLike(like);
		
		
		String str=(n>0)?"삭제 되었습니다.":"관심 상품 삭제 실패";
		
		String loc=(n>0)?"likeList":"javascript:history.back()";
		
		return common.addMsgLoc(m, str, loc);
	}
	
	@PostMapping("/select_del")
	public String selectDelete(Model m, @RequestParam("pnum") String str, @RequestParam("idx") Integer idx) {
		log.info("str/idx==="+str+"/"+idx);
		
		String[] pnum=str.split(",");
		LikeVO vo=new LikeVO();
		vo.setIdx(idx);
		//Integer.parseInt(num)
		for(int i=0; i<pnum.length; i++) {
			vo.setPnum(Integer.parseInt(pnum[i]));			
			mService.deleteLike(vo);
		}
		
		return "redirect:likeList";
	}
}
