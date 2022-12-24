package com.user.service;

import java.util.List;
import java.util.Map;

import com.board.model.PagingVO;
import com.user.model.UserVO;

public interface AdminService {	
	//List<UserVO> listUser();
	
	int deleteUser(Integer midx);

	int updateUser(UserVO user);

	UserVO selectUserByIdx(int idx);
	
	int getTotalCount();//총 게시글 수 가져오기
	int getTotalCount(PagingVO paging); //검색한 총 게시글 수 가져오기
	
	//게시목록 가져오기
	List<UserVO> selectUserAll(Map<String, Integer> map);
	List<UserVO> selectUserAllPaging(PagingVO paging);

}
