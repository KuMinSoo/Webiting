package com.user.service;

import java.util.List;

import com.board.model.PagingVO;
import com.user.model.UserVO;

public interface AdminService {
	List<UserVO> selectUserAll(PagingVO paging);

	List<UserVO> listUser();
	
	int deleteUser(Integer midx);

	int updateUser(UserVO user);

	UserVO selectUserByIdx(int idx);
	
	int getTotalCount();

}
