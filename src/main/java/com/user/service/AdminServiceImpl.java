package com.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.model.PagingVO;
import com.user.mapper.AdminMapper;
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
		return 0; 
	}

	@Override
	public int getTotalCount(PagingVO paging) {
		return this.aMapper.getTotalCount(paging);
	}

	@Override
	public List<UserVO> selectUserAll(Map<String, Integer> map) {
		return this.aMapper.selectUserAll(map);
	}

	@Override
	public List<UserVO> selectUserAllPaging(PagingVO paging) {
		return this.aMapper.selectUserAllPaging(paging);
	}

}
