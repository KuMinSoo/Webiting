package com.user.mapper;

import java.util.List;

import com.board.model.PagingVO;
import com.user.model.UserVO;

public interface AdminMapper {

	int deleteUser(Integer midx);
	
	List<UserVO> listUser();
	
	int updateUser(UserVO user);

	UserVO selectUserByIdx(int idx);
	
	int getTotalCount();
	
	List<UserVO> selectUserAll(PagingVO paging);
}
