package com.product.service;

import java.util.List;

import com.product.model.CategoryVO;
import com.product.model.ProductVO;

public interface PAdminService {
	
	public List<CategoryVO> getUpcategory();
	
	public List<CategoryVO> getDowncategory(String upCg_code);
	
	public int categoryAdd(CategoryVO cvo);
	public int categoryDelete(int cg_code);
	

	/** [������ ���]- ��ǰ ���� ����ϱ� */
	public int productInsert(ProductVO prod);
	public List<ProductVO> productList();

	// 상세 페이지 인터페이스
	public Object detailProduct(int pnum); 
	
	//연관 상품 페이지 인터페이스
	public List<ProductVO> relatedProduct(int pnum);
	
	
	public int updateHeart(int pnum);
}