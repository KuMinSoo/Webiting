package com.admin.mapper;

import java.util.List;

import com.admin.model.CountVO;
import com.admin.model.SalesVO;
import com.admin.model.UserCountVO;

public interface StatsMapper {
	List<CountVO> getOrdered();
	List<UserCountVO> getUser();
	List<UserCountVO> getAge();
	List<SalesVO> getSales();
}
