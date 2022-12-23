package com.product.mapper;

import java.util.List;

import com.product.model.CartVO;

public interface CartMapper<CartVO> {

	Integer selectCartByPnum(CartVO cartVo);
	int updateCartQty(CartVO cartVo);
	int addCart(CartVO cartVo);
	
	List<CartVO> selectCartView(int idex_fk);
	int delCart(int cartNum);
	int editCart(CartVO cartVo);
	CartVO getCart(int idx_fk);
	com.product.model.CartVO getCartTotal(int midx_fk);
}
