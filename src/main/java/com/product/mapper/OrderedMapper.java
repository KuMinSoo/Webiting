package com.product.mapper;

import java.util.List;

import com.product.model.OrderVO;
import com.product.model.OrderedDetailVO;
import com.product.model.OrderedVO;

public interface OrderedMapper {
	
	List<OrderedVO> selectAll();	
	//Order view
	int insertOrdered(OrderedVO vo);
	List<OrderedVO> selectOrdered(String ordered_no);
	int deleteOrdered(int ordered_no);
		
	//orderDetail view
	int updateDelivnum(String ordered_delivnum, int orderedNum);
	int updateOrderDetailDelivnum(String ordered_delivnum,int orderedDetail_no);
	int updateDelivCompleted(int orderedDetail_no);
	
	List<OrderedVO> selectOrderedByidx(int idx_fk);
	int insertOrder(OrderVO ovo);
	List<OrderedVO> selectOrderedByOnum(String ordered_no);
}
