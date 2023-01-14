package com.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.model.PagingVO;
import com.product.mapper.OrderedMapper;
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
	public int updateDelivStart(int orderedNum) {
		
		return this.OrderedMapper.updateDelivStart(orderedNum);
		
	}

	@Override
	public List<OrderedVO> selectAll() {
		return this.OrderedMapper.selectAll();
	}


	@Override
	public int getTotalCount(PagingVO page) {
		return this.OrderedMapper.getTotalCount(page);
	}

	@Override
	public List<OrderedVO> selectOrderedAllPaging(PagingVO page) {
		
		return this.OrderedMapper.selectOrderedAllPaging(page);
	}

	@Override
	public int updateDelivCompleted(int orderedNum) {
		return this.OrderedMapper.updateDelivCompleted(orderedNum);
	}

	@Override
	public int updateCancelCompleted(int orderedNum) {
		return this.OrderedMapper.updateCancelCompleted(orderedNum);
	}

	@Override
	public List<OrderedVO> selectCancelList(PagingVO page) {
		return this.OrderedMapper.selectCancelList(page);
	}



}
