package com.product.mapper;

import java.util.List;

import com.product.model.CategoryVO;
import com.product.model.ProductVO;

public interface ProductMapper {
	
	int productInsert(ProductVO vo);
	
	List<ProductVO> getProducts();
	
	List<ProductVO> selectByPspec(String pspec);
	List<ProductVO> selectByCategory(CategoryVO cvo);
	
	ProductVO selectByPnum(int pnum);
		

}
