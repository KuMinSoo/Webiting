package com.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.model.PagingVO;
import com.product.model.CartVO;
import com.product.model.OrderVO;
import com.user.mapper.MyPageMapper;
import com.user.model.DitchVO;
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
		//중복 처리
		Integer cnt=mMapper.selectCartCountByPnum(vo);
		
		if(cnt!=null) {
			throw new NumberFormatException("해당 상품은 이미 장바구니에 담겨있습니다.");
		}else {
			return this.mMapper.moveCart(vo);
		}
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
		int qty=cartVo.getOqty();
		if (qty==0) {
			return this.mMapper.delCart(cartVo.getCartNum());
		}else if(qty<0) {
			throw new NumberFormatException("수량은 음수로 입력하면 안됩니다.");
		}else if(qty>50) {
			throw new NumberFormatException("50개 이상 주문할 수 없습니다.");
		}else {
			return this.mMapper.editCart(cartVo);
		}
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

	@Override
	public int insertDitchProduct(DitchVO vo) {
		
		return this.mMapper.insertDitchProduct(vo);
	}

	@Override
	public List<DitchVO> ditchProdList(int idx) {
		return this.mMapper.ditchProdList(idx);
	}

	@Override
	public int deleteDitch(int dnum) {
		return this.mMapper.deleteDitch(dnum);
	}

	@Override
	public List<DitchVO> ditchProdAllList() {
		return this.mMapper.ditchProdAllList();
	}

}
