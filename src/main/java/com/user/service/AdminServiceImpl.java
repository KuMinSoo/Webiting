package com.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.model.PagingVO;
import com.user.mapper.AdminMapper;
//import com.user.model.PagingVO;
import com.user.model.UserVO;
@Service("AdminServiceImpl")
public class AdminServiceImpl implements AdminService {

	
	@Autowired
	private AdminMapper aMapper;

	@Override
	public int deleteUser(Integer midx) {
		return this.aMapper.deleteUser(midx);
	}

	@Override
	public int updateUser(UserVO user) {
		return this.aMapper.updateUser(user);
	}


	@Override
	public UserVO selectUserByIdx(int idx) {
		return this.aMapper.selectUserByIdx(idx);
	}

	@Override
	public int getTotalCount() {
		return this.aMapper.getTotalCount(); 
	}

	/*
	 * @Override public List<UserVO> selectUserAll(PagingVO paging) { //return
	 * this.aMapper.selectUserAll(paging); return null; }
	 * 
	 * @Override public List<UserVO> listUser(PagingVO pvo) { return
	 * this.aMapper.listUser(pvo); }
	 */

	@Override
	public List<UserVO> selectBoardAll(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserVO> listUser(PagingVO pvo) {
		// TODO Auto-generated method stub
		return null;
	}

}
