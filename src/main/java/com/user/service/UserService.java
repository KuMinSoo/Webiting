package com.user.service;

import java.util.List;

import com.user.model.NotUserException;
//import com.user.model.PagingVO;
import com.user.model.UserVO;

public interface UserService {
	int createUser(UserVO user);
	
	boolean idCheck(String userid);

	//List<UserVO> listUser(PagingVO pvo);
	
	int deleteUser(Integer midx);

	int updateUser(UserVO user);

	UserVO getUser(Integer midx);

	UserVO findUser(UserVO findUser) throws NotUserException;

	UserVO loginCheck(String userid, String pwd) throws NotUserException;

	UserVO emailCheck(String kakaoEmail);
	
	List<UserVO> listUser();
}
 