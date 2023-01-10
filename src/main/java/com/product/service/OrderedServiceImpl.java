package com.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.product.mapper.OrderedMapper;
import com.product.model.OrderedDetailVO;
import com.product.model.OrderedVO;

@Service
public class OrderedServiceImpl implements OrderedService {

	@Autowired
	OrderedMapper OrderedMapper;
	
	@Override
	public int insertOrdered(OrderedVO vo) {
		
		return this.OrderedMapper.insertOrdered(vo);
	}

	@Override
	public List<OrderedVO> selectOrdered(int ordered_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteOrdered(int ordered_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public OrderedDetailVO selectOrderDetailDelivnum(int orderedDetail_no) {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public int updateDelivCompleted(int orderedNum) {
		
		return this.OrderedMapper.updateDelivCompleted(orderedNum);
		
	}

	@Override
	public List<OrderedVO> selectAll() {
		return this.OrderedMapper.selectAll();
	}

	@Override
	public int updateDelivnum(String ordered_delivnum, int orderedNum) {
		// TODO Auto-generated method stub
		return 0;
	}

}
