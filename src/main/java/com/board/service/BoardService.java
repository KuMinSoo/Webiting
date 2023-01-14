package com.board.service;

import java.util.List;
import java.util.Map;

import com.board.model.BoardVO;
import com.board.model.PagingVO;

public interface BoardService {
	
	int insertBoard(BoardVO board);

	List<BoardVO> selectBoardAll(Map<String,Integer> map);
	List<BoardVO> selectBoardAllPaging(PagingVO paging);
  
	int getTotalCount(PagingVO paging);


	BoardVO selectBoardByIdx(Integer idx);   

	int updateReadnum(Integer idx);
	   

	int deleteBoard(Integer idx);
	int updateBoard(BoardVO board);


	int rewriteBoard(BoardVO board);
	BoardVO selectRefLevPasswd(int idx);
	
	int updateAdminSunbun(BoardVO board);
}