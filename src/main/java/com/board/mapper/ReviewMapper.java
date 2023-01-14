	
package com.board.mapper;

import java.util.List;

import com.board.model.ReviewVO;

public interface ReviewMapper {
	
	public List<ReviewVO> getReviewList(int pnum);

	public int insertReview(ReviewVO review);

	public int updateReview(ReviewVO review);

	public int deleteReview(Integer revnum);

	
	
}





	

	
	
