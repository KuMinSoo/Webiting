package com.board.service;

import java.util.List;
import java.util.Map;

//import com.board.model.RPagingVO;
import com.board.model.ReviewVO;

public interface ReviewService {

	int insertReview(ReviewVO review);
	
	List<ReviewVO> selectReviewAll(Map<String,Integer> map);
	//List<ReviewVO> selectReviewAllPaging(RPagingVO rpaging);
	   
	// 검색목록 가져오기
	//List<ReviewVO> findReview(RPagingVO paging);
	   
	int getTotalRCount();//총 게시글 수 가져오기
	//int getTotalRCount(RPagingVO paging);//검색한 총 게시글 수 가져오기

	// 글번호에 해당하는 글 가져오기
	ReviewVO selectReviewByRevNum(Integer revnum);
	
	// 조회수 증가하기
	int updateReadnum(Integer revnum);
	   
	String selectPwd(Integer revnum);
	int deleteReview(Integer revnum);
	int updateReview(ReviewVO review);

	//List<ReviewVO> selectBoardAllRPaging(RPagingVO rpage);

	List<ReviewVO> getReviewList(int pnum);
	List<ReviewVO> getReviewEdit();
	List<ReviewVO> ReviewDelete();

	
}
