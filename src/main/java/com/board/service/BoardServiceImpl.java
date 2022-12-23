package com.board.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.mapper.BoardMapper;
import com.board.model.BoardVO;
import com.board.model.PagingVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardMapper bMapper;

	@Override
	public int insertBoard(BoardVO board) {
		return this.bMapper.insertBoard(board);
	}

	@Override
	public List<BoardVO> selectBoardAll(Map<String, Integer> map) {		
		return this.bMapper.selectBoardAll(map);
	}

	@Override
	public List<BoardVO> selectBoardAllPaging(PagingVO paging) {		
		return this.bMapper.selectBoardAllPaging(paging);
	}

	@Override
	public List<BoardVO> findBoard(PagingVO paging) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalCount() {		
		return 0;
	}

	@Override
	public int getTotalCount(PagingVO paging) {
		return this.bMapper.getTotalCount(paging);
	}

	@Override
	public BoardVO selectBoardByIdx(Integer num) {
		
		return this.bMapper.selectBoardByIdx(num);
	}

	@Override
	public int updateReadnum(Integer num) {		
		return this.bMapper.updateReadnum(num);
	}

	@Override
	public String selectPwd(Integer idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteBoard(Integer idx) {		
		return this.bMapper.deleteBoard(idx);
	}

	@Override
	public int updateBoard(BoardVO board) {
		return this.bMapper.updateBoard(board);
	}

	@Override
	public int rewriteBoard(BoardVO board) {		
		//[1] 遺�紐④�(�썝湲�)�쓽 湲�踰덊샇(num)濡� 遺�紐④��쓽 refer(湲�洹몃９踰덊샇), lev(�떟蹂��젅踰�), sunbun(�닚踰�) 媛��졇�삤湲�
		//==> select臾�
		BoardVO parent=this.selectRefLevSunbun(board.getNum());
		
		//[2] 湲곗〈�뿉 �떖由� �떟蹂�湲� �뱾�씠 �엳�떎硫� �궡 �떟蹂�湲��쓣 insert�븯湲� �쟾�뿉 湲곗〈�쓽 �떟蹂�湲��뱾�쓽 sunbun�쓣 �븯�굹�뵫 利앷��떆�궎�옄.
		//==> update臾�
		
		int n=this.updateSunbun(parent);
		
		//[3] �궡媛� �벖 �떟蹂� 湲��쓣 insert �븳�떎===> insert臾�
		//�궡媛� �벖 �떟蹂�湲�==>board
		//遺�紐④� ==>parent (遺�紐④��쓽 refer,lev,sunbun)
		board.setRefer(parent.getRefer());//湲�洹몃９ 踰덊샇瑜� 遺�紐④�怨� �룞�씪�븯寃�
		board.setLev(parent.getLev()+1);//�떟蹂��젅踰�=遺�紐쮔ev+1
		board.setSunbun(parent.getSunbun()+1);//�닚�꽌=遺�紐쮛unbun+1
		return this.bMapper.rewriteBoard(board);
	}

	@Override
	public BoardVO selectRefLevSunbun(int idx) {		
		return this.bMapper.selectRefLevSunbun(idx);
	}

	@Override
	public int updateSunbun(BoardVO parent) {		
		return this.bMapper.updateSunbun(parent);
	}

}
