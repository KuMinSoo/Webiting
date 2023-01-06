package com.product.mapper;

import java.util.List;

import com.product.model.OrderedDetailVO;
import com.product.model.OrderedVO;

public interface OrderedMapper {
	
	
	//Order view
	int insertOrdered(OrderedVO vo);
	List<OrderedVO> selectOrdered(int ordered_no);
	int deleteOrdered(int ordered_no);
		
	//orderDetail view
	OrderedDetailVO selectOrderDetailDelivnum(int orderedDetail_no);//orderDetailVO에서 해당 상품정보 가져오기	
	int updateOrderDetailDelivnum(String ordered_delivnum,int orderedDetail_no);//orderDetailVO에서 해당 상품정보에 송장번호 삽입하기
	int updateDelivCompleted(int orderedDetail_no);//배송중-->배송완료
}
