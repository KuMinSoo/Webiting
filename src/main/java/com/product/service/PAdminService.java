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
	

}