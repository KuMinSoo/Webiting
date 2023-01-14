package com.product.service;

import java.util.List;

import com.board.model.PagingVO;
import com.product.model.OrderVO;
import com.product.model.OrderedDetailVO;
import com.product.model.OrderedVO;

public interface OrderedService {
		//Order view
		int insertOrdered(OrderedVO vo);
		List<OrderedVO> selectOrdered(String ordered_no);
		List<OrderedVO> selectOrderedByidx(int idx_fk);
		int deleteOrdered(int ordered_no);
		List<OrderedVO> selectAll();	
		//orderDetail view
		OrderedDetailVO selectOrderDetailDelivnum(int orderedDetail_no);	
		int updateDelivnum(String ordered_delivnum,int orderedNum);
		int insertOrder(OrderVO ovo);
		List<OrderedVO> selectOrderedByOnum(String ordered_no);


		int updateDelivStart(int orderedNum);
		int updateCancelCompleted(int orderedNum);
		int getTotalCount(PagingVO page);
		
		
		List<OrderedVO> selectOrderedAllPaging(PagingVO page);	
		List<OrderedVO> selectCancelList(PagingVO page);
		int updateDelivCompleted(int orderedNum);
		

}
