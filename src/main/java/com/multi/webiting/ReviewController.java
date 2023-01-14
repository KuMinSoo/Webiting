package com.multi.webiting;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.board.model.BoardVO;
import com.board.model.ReviewVO;
import com.board.service.ReviewService;
import com.common.CommonUtil;

@Controller
public class ReviewController {

	@Inject
	private CommonUtil util;

	@Inject
	private ReviewService reviewService;

	@GetMapping("/reviewForm")
	public String reviewList(Model m, @RequestParam("pnum") int pnum) {// 별점 파트

		// 상품 번호 pnum_fk '1'번의 모든 리뷰에 리스트를 불러오기
		List<ReviewVO> reviewArr = reviewService.getReviewList(pnum);
		double starSize = reviewArr.size(); 
		double star5 = 0;
		double star4 = 0;
		double star3 = 0;
		double star2 = 0;
		double star1 = 0;

		// int 소수점 밑에 값을 무시 double 값을 줘야 평균값을 구할 수 있다

		for (int i = 0; i < reviewArr.size(); i++) {
			if (reviewArr.get(i).getStar() == 5) {
				star5++;
			} else if (reviewArr.get(i).getStar() == 4) {
				star4++;
			} else if (reviewArr.get(i).getStar() == 3) {
				star3++;
			} else if (reviewArr.get(i).getStar() == 2) {
				star2++;
			} else if (reviewArr.get(i).getStar() == 1) {
				star1++;
			}
		}
		double rstar5 = star5 / reviewArr.size() * 100;
		double rstar4 = star4 / reviewArr.size() * 100;
		double rstar3 = star3 / reviewArr.size() * 100;
		double rstar2 = star2 / reviewArr.size() * 100;
		double rstar1 = star1 / reviewArr.size() * 100;

		List<Long> starList = new ArrayList<>();
		// get(0)
		starList.add(Math.round(rstar1));
		// get(1)
		starList.add(Math.round(rstar2));
		// get(2)
		starList.add(Math.round(rstar3));
		// get(3)
		starList.add(Math.round(rstar4));
		// get(4)
		starList.add(Math.round(rstar5));
		// 별점 1점 ~ 5점 퍼센트값을 모두 구한 후 List하나 생성 후 view 반환
		m.addAttribute("starList", starList);
		m.addAttribute("reviewList", reviewArr);
		return "review/reviewForm";
	}

	/*
	 * @GetMapping("/reviewForm/{revnum}") public String
	 * boardView(@PathVariable("revnum") int num, Model m) { int n =
	 * this.reviewService.updateReadnum(revnum); ReviewVO review =
	 * this.reviewService.selectReviewByIdx(revnum);
	 * m.addAttribute("review",review);
	 * 
	 * return "review/reviewForm";
	 * 
	 * }
	 */

	/*// 게시판 수정
	 * @GetMapping("/ReviewEdit") public String boardEditForm(Model m,
	 * 
	 * @RequestParam(defaultValue = "0") int num,
	 * 
	 * @RequestParam(defaultValue = "") String passwd) {
	 * if(num==0||passwd.isEmpty()) { return "redirect:list"; }
	 * 
	 * ReviewVO rvo=this.rService.selectReviewByIdx(num);
	 * 
	 * if(rvo==null) { return util.addMsgBack(m, "해당 글이 존재하지 않습니다."); }
	 * if(!vo.getPasswd().equals(passwd)) { return util.addMsgBack(m,
	 * "비밀번호가 일치하지 않습니다"); }
	 * 
	 * m.addAttribute("reviewEdit", rvo);
	 * 
	 * return "review/reviewEdit"; }
	 */
	
	 // 게시판 해당 글삭제
		/*
		 * @PostMapping("/delete") public String reviewDelete(Model m,
		 * HttpServletRequest req, @RequestParam(defaultValue = "0") int revnum) {
		 * ReviewVO rvo=this.reviewService.selectReviewByIdx(revnum);
		 * 
		 * if(rvo==null) { return util.addMsgBack(m, "해당글은 존재하지 않습니다"); }
		 * 
		 * int n=this.reviewService.deleteReview(revnum);
		 * 
		 * ServletContext app=req.getServletContext(); String
		 * upDir=app.getRealPath("/resources/board_upload");
		 * 
		 * if(n>0 && rvo.getFilename()!=null) {
		 * 
		 * File f=new File(upDir, rvo.getFilename()); if(f.exists()) { boolean
		 * b=f.delete(); log.info("파일삭제 여부: "+b); } } String str=(n>0)?"삭제 성공":"삭제 실패";
		 * String loc=(n>0)?"list":"javascript:history.back()"; return util.addMsgLoc(m,
		 * str, loc); 
		 * 
		 * }
		 */
		@GetMapping("/reviewForm/delete")
		public String reviewDelete(@RequestParam("revnum") int revnum) {
			
			return "admin/prodDetail";
		}
	
		
		
	  @GetMapping("/reviewForm/write")
		public String reviewdWrite(Model m, @RequestParam("pnum") int pnum, @ModelAttribute ReviewVO vo) {
			m.addAttribute("pnum",pnum);
			return "review/reviewWrite";
		}
	
	  @PostMapping("/reviewForm/write")
	  public String reviewInsert(@RequestParam("mfilename") MultipartFile mfilename, HttpServletRequest req, Model m, 
		  @ModelAttribute ReviewVO review) {
		  ServletContext app=req.getServletContext();
	  
	  int n=0; String str="",loc="";
	  if("write".equals(review.getMode())) {
	  n=this.reviewService.insertReview(review); str+="글쓰기 "; 
	  } else if("edit".equals(review.getMode())) {
	  n=this.reviewService.updateReview(review); str+="글수정 "; }
	  str+=(n>0)?"성공":"실패"; loc=(n>0)?"../prodDetail?pnum="+review.getPnum_fk():"javascript:history.back()";
	  
	  return util.addMsgLoc(m, str, loc); }
	 
}