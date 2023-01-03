package com.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.mapper.BoardMapper;
import com.board.model.BoardVO;
import com.board.model.PagingVO;

import lombok.extern.log4j.Log4j;


@Log4j
@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService {
	  
	@Autowired
	private BoardMapper boardMapper;

	@Override
	public int insertBoard(BoardVO board) {
		return this.boardMapper.insertBoard(board);
	}

	@Override
	public List<BoardVO> selectBoardAll(Map<String, Integer> map) {		
		return this.boardMapper.selectBoardAll(map);
	}

	@Override
	public List<BoardVO> selectBoardAllPaging(PagingVO paging) {		
		return this.boardMapper.selectBoardAllPaging(paging);
	}



	@Override
	public int getTotalCount(PagingVO paging) {
		return this.boardMapper.getTotalCount(paging);
	}

	@Override
	public BoardVO selectBoardByIdx(Integer num) {
		
		return this.boardMapper.selectBoardByIdx(num);
	}

	@Override
	public int updateReadnum(Integer num) {		
		return this.boardMapper.updateReadnum(num);
	}



	@Override
	public int deleteBoard(Integer idx) {		
		return this.boardMapper.deleteBoard(idx);
	}

	@Override
	public int updateBoard(BoardVO board) {
		return this.boardMapper.updateBoard(board);
	}
	public int updateAdminSunbun(BoardVO board) {
		
		return this.boardMapper.updateAdminSunbun(board);
	}
	@Override
	public int rewriteBoard(BoardVO board) {		
	
		
		BoardVO parent=this.boardMapper.selectRefLevPasswd(board.getNum());
		
		board.setPasswd(parent.getPasswd());//해당 회원의 비밀글을 입력한다.
		board.setRefer(parent.getRefer());//글그룹 번호를 부모글과 동일하게
		board.setLev(parent.getLev()+1);//답변레벨=부모lev+1
		return this.boardMapper.rewriteBoard(board);
	}
	@Override
	public BoardVO selectRefLevPasswd(int idx) {		
		return this.boardMapper.selectRefLevPasswd(idx);
	}



}
