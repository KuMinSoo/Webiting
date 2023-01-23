package com.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.admin.mapper.StatsMapper;
import com.admin.model.CountVO;
import com.admin.model.SalesVO;
import com.admin.model.UserCountVO;

@Service("statsServiceImpl")
public class StatsServiceImpl implements StatsService {
	
	@Inject
	private StatsMapper statsMapper;

	@Override
	public List<CountVO> getOrdered() {
		return this.statsMapper.getOrdered();
	}

	@Override
	public List<UserCountVO> getUser() {
		return this.statsMapper.getUser();
	}

	@Override
	public List<UserCountVO> getAge() {
		return this.statsMapper.getAge();
	}

	@Override
	public List<SalesVO> getSales() {
		return this.statsMapper.getSales();
	}

}
