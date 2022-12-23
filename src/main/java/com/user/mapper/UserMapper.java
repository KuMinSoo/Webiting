package com.user.mapper;

import java.util.List;


import com.user.model.NotUserException;
//import com.user.model.PagingVO;
import com.user.model.UserVO;
public interface UserMapper {
	int createUser(UserVO user);
	
	Integer idCheck(String userid);

	int deleteUser(Integer midx);
	
	List<UserVO> listUser();
	
	int updateUser(UserVO user);

	UserVO getUser(Integer midx);

	UserVO findUser(UserVO findUser) throws NotUserException;

	UserVO loginCheck(String userid) throws NotUserException;

	UserVO emailCheck(String kakaoEmail);

}
