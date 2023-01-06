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
		// TODO Auto-generated method stub
		return 0;
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
	public int updateOrderDetailDelivnum(String ordered_delivnum, int orderedDetail_no) {

		return this.OrderedMapper.updateOrderDetailDelivnum(ordered_delivnum, orderedDetail_no);
	}
	@Override
	public int updateDelivCompleted(int orderedDetail_no) {
		
		return this.OrderedMapper.updateDelivCompleted(orderedDetail_no);
		
	}//배송중 --> 배송완료

}
