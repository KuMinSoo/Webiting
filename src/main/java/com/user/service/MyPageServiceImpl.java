package com.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.model.PagingVO;
import com.product.model.CartVO;
import com.product.model.OrderVO;
import com.user.mapper.MyPageMapper;
import com.user.model.LikeVO;

@Service("MyPageServiceImpl")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageMapper mMapper;

	@Override
	public List<LikeVO> selectLikeAll(Map<String, Integer> map) {
		return this.mMapper.selectLikeAll(map);
	}

	@Override
	public int getTotalCount(PagingVO paging) {
		return this.mMapper.getTotalCount(paging);
	}

	@Override
	public List<LikeVO> selectLikeAllPaging(PagingVO paging) {
		return this.mMapper.selectLikeAllPaging(paging);
	}

	@Override
	public int deleteLike(LikeVO like) {
		return this.mMapper.deleteLike(like);
	}

	@Override
	public int moveCart(CartVO vo) {
		return this.mMapper.moveCart(vo);
	}

	@Override
	public List<CartVO> selectCartView(int idx_fk) {
		return this.mMapper.selectCartView(idx_fk);
	}

	@Override
	public CartVO getCartTotal(int idx_fk) {
		return this.mMapper.getCartTotal(idx_fk);
	}

	@Override
	public int delCart(int cartNum) {
		return this.mMapper.delCart(cartNum);
	}

	@Override
	public int updateCartQty(CartVO cartVo) {
		return this.mMapper.updateCartQty(cartVo);
	}

	@Override
	public int editCart(CartVO cartVo) {
		return this.mMapper.editCart(cartVo);
	}

	@Override
	public int goOrder(OrderVO ovo) {
		return this.mMapper.goOrder(ovo);
	}

	@Override
	public List<OrderVO> selectOrderView(int idx_fk) {
		return this.mMapper.selectOrderView(idx_fk);
	}

	@Override
	public OrderVO getOrderTotal(int idx_fk) {
		return this.mMapper.getOrderTotal(idx_fk);
	}

	@Override
	public int insertLikeProd(LikeVO like) {
		return this.mMapper.insertLikeProd(like);
	}

}
