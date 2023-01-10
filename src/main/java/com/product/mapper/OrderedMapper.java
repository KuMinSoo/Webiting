package com.product.mapper;

import java.util.List;

import com.product.model.OrderedDetailVO;
import com.product.model.OrderedVO;

public interface OrderedMapper {
	
	List<OrderedVO> selectAll();	
	//Order view
	int insertOrdered(OrderedVO vo);
	List<OrderedVO> selectOrdered(int ordered_no);
	int deleteOrdered(int ordered_no);
		
	//orderDetail view
	int updateDelivnum(String ordered_delivnum, int orderedNum);
	int updateOrderDetailDelivnum(String ordered_delivnum,int orderedDetail_no);
	int updateDelivCompleted(int orderedDetail_no);
}
