package com.admin.service;

import java.util.List;

import com.admin.model.CountVO;
import com.admin.model.MonthVO;
import com.admin.model.SalesVO;
import com.admin.model.UserCountVO;

public interface StatsService {
	List<CountVO> getOrdered();
	List<UserCountVO> getUser();
	List<UserCountVO> getAge();
	List<SalesVO> getSales();
	List<MonthVO> getMonthSales();
}
