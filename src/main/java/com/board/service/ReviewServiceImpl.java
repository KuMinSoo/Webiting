package com.board.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.mapper.ReviewMapper;
/*import com.board.model.BoardVO;*/
//import com.board.model.RPagingVO;
import com.board.model.ReviewVO;
/*import com.common.repo.ReviewDAO;*/

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Inject
	private ReviewMapper reviewMapper;
	
	public List<ReviewVO> getReviewList(int pnum){
		
		return reviewMapper.getReviewList(pnum);
	}

	@Override
	public int insertReview(ReviewVO review) {
		// TODO Auto-generated method stub
		return reviewMapper.insertReview(review);
	}

	@Override
	public List<ReviewVO> selectReviewAll(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * @Override public List<ReviewVO> selectReviewAllPaging(RPagingVO rpaging) { //
	 * TODO Auto-generated method stub return null; }
	 * 
	 * @Override public List<ReviewVO> findReview(RPagingVO paging) { // TODO
	 * Auto-generated method stub return null; }
	 */

	@Override
	public int getTotalRCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	/*
	 * @Override public int getTotalRCount(RPagingVO paging) { // TODO
	 * Auto-generated method stub return 0; }
	 */

	@Override
	public ReviewVO selectReviewByRevNum(Integer revnum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateReadnum(Integer revnum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String selectPwd(Integer revnum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteReview(Integer revnum) {
		
		return 0;
	}

	@Override
	public int updateReview(ReviewVO review) {
		// TODO Auto-generated method stub
		return reviewMapper.updateReview(review);
	}

	/*
	 * @Override public List<ReviewVO> selectBoardAllRPaging(RPagingVO rpage) { //
	 * TODO Auto-generated method stub return null; }
	 */

	@Override
	public List<ReviewVO> getReviewEdit() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReviewVO> ReviewDelete() {
		
		return null;
	}
}
