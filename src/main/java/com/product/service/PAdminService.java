package com.product.service;

import java.util.List;

import com.board.model.PagingVO;
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

	
	/* 상세 페이지 service
	 public int prodDetail(ProductVO prod); */
	public List<ProductVO> productListCategory( String downCg_code);
	public List<ProductVO> selectProductAllPaging(PagingVO paging);
	public int getTotalCount(PagingVO page);

	public int getTotalCountCategory(String downCg_code);

	// 상세 페이지 인터페이스
	public Object detailProduct(int pnum); 
		
}