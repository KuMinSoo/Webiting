package com.product.mapper;

import java.util.List;


import com.product.model.OrderVO;


import com.board.model.PagingVO;

import com.product.model.OrderedVO;

public interface OrderedMapper {
	
	List<OrderedVO> selectAll();	
	
	int insertOrdered(OrderedVO vo);

	int deleteOrdered(int ordered_no);
	
	int updateOrderDetailDelivnum(String ordered_delivnum,int orderedDetail_no);
	
	List<OrderedVO> selectOrderedByidx(int idx_fk);

	List<OrderedVO> selectOrderedByOnum(OrderedVO ovo);
	List<OrderedVO> selectOrdered(OrderedVO ovo);

	int insertOrder(OrderVO ovo);
	List<OrderedVO> selectOrderedByOnum(String ordered_no);


	int updateDelivStart(int orderedNum);
	int updateDelivCompleted(int orderedNum);
	int getTotalCount(PagingVO page);
	int getCancelCount(PagingVO page);
	int updateCancelCompleted(int orderedNum);
	List<OrderedVO> selectCancelList(PagingVO page);
	List<OrderedVO> selectOrderedAllPaging(PagingVO page);

	int updateRefund(OrderedVO ovo);
	OrderedVO selectOrderedByorderedNum(int orderedNum);
	List<OrderedVO> selectRefundByidx(int idx_fk);
	int insertOrdered(OrderVO ovo);		
	List<OrderedVO> selectYetRefund(OrderedVO ovo);
	
	int updateSqty(OrderedVO ovo);
	
}
