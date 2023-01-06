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
	ProductVO detailProduct(int pnum);
	
	List<ProductVO> relatedProduct(int pnum);

	int updateHeart(int pnum);

	int selectHeart(int pnum);

	int insertHeart(int pnum);

	int heartCount(int pnum);
}
