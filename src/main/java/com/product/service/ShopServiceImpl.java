package com.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.product.mapper.CartMapper;
import com.product.mapper.ProductMapper;
import com.product.model.CartVO;
import com.product.model.ProductVO;

@Service("ShopServiceImpl")
public class ShopServiceImpl implements ShopService {
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private CartMapper cartMapper;

	@Override
	public List<ProductVO> selectByPspec(String pspec) {
		return this.productMapper.selectByPspec(pspec);
	}

	@Override
	public List<ProductVO> selectByCategory(int cg_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductVO selectByPnum(int pnum) {		
		return this.productMapper.selectByPnum(pnum);
	}

	@Override
	public int addCart(CartVO cartVo) {
		//[0] ��ǰ��ȣ�� ȸ����ȣ�� cart ���̺� �ִ� ��ǰ���� ��������
		Integer cnt=cartMapper.selectCartByPnum(cartVo);
		if(cnt!=null) {
			// [1] ��ٱ��Ͽ� �߰��ϴ� ��ǰ�� �̹� ��ٱ��Ͽ� ��� �ִ� �����==> ������ ����(������ �߰�)=> update��
			int n=cartMapper.updateCartQty(cartVo);
			return n;
		}else {
			// [2] ��ٱ��Ͽ� ���� ��ǰ�� ���� �����==> insert��
			int n=cartMapper.addCart(cartVo);
			return n;
		}		
	}

	@Override
	public int updateCartQty(CartVO cartVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int editCart(CartVO cartVo) {
		//������ ���� �ٸ��� ó���غ���
		int qty=cartVo.getOqty();
		if(qty==0) {//������ 0�̸� ����ó��
			return this.cartMapper.delCart(cartVo.getCartNum());
		}else if(qty<0) {
			throw new NumberFormatException("������ ������ �Է��ϸ� �ȵ˴ϴ�");
		}else if(qty>50){
			throw new NumberFormatException("50�� �̳��θ� ���� �����մϴ�");
		}else{//������ ����� ����ó��
		
			return this.cartMapper.editCart(cartVo);
		}
	}

	@Override
	public List<CartVO> selectCartView(int midx) {		
		return this.cartMapper.selectCartView(midx);
	}

	@Override
	public int delCart(int cartNum) {
		return this.cartMapper.delCart(cartNum);
	}

	@Override
	public int delCartAll(CartVO cartVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delCartOrder(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getCartCountByIdx(CartVO cartVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CartVO getCartTotal(int midx_fk) {
		return this.cartMapper.getCartTotal(midx_fk);
	}

	@Override
	public void delCartByOrder(int midx_fk, int pnum) {
		// TODO Auto-generated method stub

	}

}
