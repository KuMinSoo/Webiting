package com.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.product.mapper.CategoryMapper;
import com.product.mapper.ProductMapper;
import com.product.model.CategoryVO;
import com.product.model.ProductVO;

@Service("padminService")
public class PAdminServiceImpl implements PAdminService {
	
	@Inject
	private CategoryMapper categoryMapper;
	
	@Inject
	private ProductMapper productMapper;

	@Override
	public List<CategoryVO> getUpcategory() {

		return categoryMapper.getUpcategory();
	}

	@Override
	public List<CategoryVO> getDowncategory(String upCg_code) {	
		return this.categoryMapper.getDowncategory(upCg_code);
	}

	@Override
	public int categoryAdd(CategoryVO cvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int categoryDelete(int cg_code) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int productInsert(ProductVO prod) {		
		return this.productMapper.productInsert(prod);
	}

	@Override
	public List<ProductVO> productList() {		
		return this.productMapper.getProducts();
	}
	
	// 상세 페이지 PAdminservice 인터페이스 구현 클래스
	@Override
	public ProductVO detailProduct(int pnum) {
		
		return this.productMapper.detailProduct(pnum);
	}
	
	// 연관 상품 페이지 PAdminservice 인터페이스 구현 클래스
	@Override
	public List<ProductVO> relatedProduct(int pnum) {
		
		return this.productMapper.relatedProduct(pnum);
	}
	
	public int updateHeart(int pnum) {
		// 좋아요가 DB에 저장이 되는것이 없으면 0이 그대로 리턴으로 넘어감
		
		int result = this.productMapper.selectHeart(pnum);
		//System.out.println("result="+result);
		// 좋아요가 이미 있는지 확인하는 코드
		if(result==0) {
			
			result = this.productMapper.insertHeart(pnum);
			
		}else if(result>0){
			
			result=this.productMapper.updateHeart(pnum);
			
		//System.out.println("result2="+result);
		
		}
		
		//해당 상품의 하트수 가져오기
		int cnt=this.productMapper.heartCount(pnum);
	    	// 0 or 1이 담겨져서 @Controller에 보냄.
		//System.out.println("cnt="+cnt);
		return cnt;
	}

}
