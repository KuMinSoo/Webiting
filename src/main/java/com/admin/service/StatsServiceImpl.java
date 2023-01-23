package com.admin.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.admin.mapper.StatsMapper;
import com.admin.model.CountVO;
import com.admin.model.MonthVO;
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

	@Override
	public List<MonthVO> getMonthSales() {
		List<MonthVO> list= this.statsMapper.getMonthSales();
		List<MonthVO> list2= new ArrayList<>();
		MonthVO mvo=new MonthVO();
		//int[] arr=new int[12];
		for(int i=0;i<list.size();i++) {
			MonthVO vo=list.get(i);
			int j=i;
			while(true) {
				if(vo.getOrdered_date()==(j+1)) {
					mvo.setOrdered_date(list.get(i).getOrdered_date());
					mvo.setTotalprice(list.get(i).getTotalprice());
					list2.add(mvo);
					break;
				}else {
					mvo.setOrdered_date(j+1);
					mvo.setTotalprice(0);
					list2.add(mvo);
					j++;
				}
			}
		}
		
		return list2;
	}

}
