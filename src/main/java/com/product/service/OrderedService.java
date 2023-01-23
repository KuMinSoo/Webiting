package com.product.service;

import java.util.List;

import com.board.model.PagingVO;

import com.product.model.OrderVO;

import com.product.model.OrderedVO;

public interface OrderedService {
		//Order view
		int insertOrdered(OrderedVO vo);
		List<OrderedVO> selectOrderedByidx(int idx_fk);
		int deleteOrdered(int ordered_no);
		List<OrderedVO> selectAll();	
		//orderDetail view

		int updateDelivnum(String ordered_delivnum,int orderedNum);
		List<OrderedVO> selectOrderedByOnum(OrderedVO ovo);
		List<OrderedVO> selectOrdered(OrderedVO ovo);	

		int updateDelivStart(int orderedNum);
		int updateCancelCompleted(int orderedNum);
		int getTotalCount(PagingVO page);
		

		int getCancelCount(PagingVO page);

		List<OrderedVO> selectOrderedAllPaging(PagingVO page);	
		List<OrderedVO> selectCancelList(PagingVO page);
		int updateDelivCompleted(int orderedNum);
		int updateRefund(OrderedVO ovo);
		OrderedVO selectOrderedByorderedNum(int orderedNum);
		List<OrderedVO> selectRefundByidx(int idx_fk);
		int insertOrder(OrderVO ovo);
		List<OrderedVO> selectYetRefund(OrderedVO ovo);
		
		int updateSqty(OrderedVO ovo);
			

}
