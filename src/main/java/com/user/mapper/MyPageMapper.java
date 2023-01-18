package com.user.mapper;

import java.util.List;
import java.util.Map;

import com.board.model.PagingVO;
import com.product.model.CartVO;
import com.product.model.OrderedVO;
import com.user.model.LikeVO;

public interface MyPageMapper {
	int getTotalCount(PagingVO paging);
	List<LikeVO> selectLikeAll(Map<String, Integer> map);//목록 가져오기	
	List<LikeVO> selectLikeAllPaging(PagingVO paging);
	
	int deleteLike(LikeVO like);
	int moveCart(CartVO vo);
	
	List<CartVO> selectCartView(int idx_fk);
	CartVO getCartTotal(int idx_fk);
	int delCart(int cartNum);
	int updateCartQty(CartVO cartVo);
	int editCart(CartVO cartVo);
	
	int goOrder(OrderedVO ovo);
	List<OrderedVO> selectOrderView(int idx_fk);
	OrderedVO getOrderTotal(int idx_fk);
	int insertLikeProd(LikeVO like);
	
	Integer selectCartCountByPnum(CartVO cartVO); //상품번호로 장바구니에 있는 상품조회
}
