package com.product.mapper;

import java.util.List;


import com.product.model.OrderVO;
import com.product.model.OrderedDetailVO;

import com.board.model.PagingVO;

import com.product.model.OrderedVO;

public interface OrderedMapper {
	
	List<OrderedVO> selectAll();	
	
	int insertOrdered(OrderedVO vo);

	List<OrderedVO> selectOrdered(String ordered_no);
	int deleteOrdered(int ordered_no);


		
	
	int updateOrderDetailDelivnum(String ordered_delivnum,int orderedDetail_no);

	
	List<OrderedVO> selectOrderedByidx(int idx_fk);
	int insertOrder(OrderVO ovo);
	List<OrderedVO> selectOrderedByOnum(String ordered_no);

	int updateDelivStart(int orderedNum);
	int updateDelivCompleted(int orderedNum);
	int getTotalCount(PagingVO page);
	int updateCancelCompleted(int orderedNum);
	List<OrderedVO> selectCancelList(PagingVO page);
	List<OrderedVO> selectOrderedAllPaging(PagingVO page);
	
}
