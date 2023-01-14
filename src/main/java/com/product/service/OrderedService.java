package com.product.service;

import java.util.List;

import com.board.model.PagingVO;
import com.product.model.OrderedVO;

public interface OrderedService {
		
		List<OrderedVO> selectOrdered(int ordered_no);
		
		int insertOrdered(OrderedVO vo);
		int updateDelivStart(int orderedNum);
		int updateDelivCompleted(int orderedNum);
		int updateCancelCompleted(int orderedNum);
		int getTotalCount(PagingVO page);
		
		
		
		List<OrderedVO> selectAll();
		List<OrderedVO> selectOrderedAllPaging(PagingVO page);	
		List<OrderedVO> selectCancelList(PagingVO page);
		

}
