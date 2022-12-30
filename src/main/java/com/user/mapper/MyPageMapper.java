package com.user.mapper;

import java.util.List;
import java.util.Map;

import com.board.model.PagingVO;
import com.user.model.LikeVO;

public interface MyPageMapper {
	int getTotalCount(PagingVO paging);
	List<LikeVO> selectLikeAll(Map<String, Integer> map);//목록 가져오기	
	List<LikeVO> selectLikeAllPaging(PagingVO paging);
	
	int deleteLike(LikeVO like);
}
