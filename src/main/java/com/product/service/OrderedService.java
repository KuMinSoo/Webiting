package com.product.service;

import java.util.List;

import com.product.model.OrderedDetailVO;
import com.product.model.OrderedVO;

public interface OrderedService {
		//Order view
		int insertOrdered(OrderedVO vo);
		List<OrderedVO> selectOrdered(int ordered_no);
		int deleteOrdered(int ordered_no);
		List<OrderedVO> selectAll();	
		//orderDetail view
		OrderedDetailVO selectOrderDetailDelivnum(int orderedDetail_no);	
		int updateDelivnum(String ordered_delivnum,int orderedNum);
		int updateDelivCompleted(int orderedDetail_no);
}
