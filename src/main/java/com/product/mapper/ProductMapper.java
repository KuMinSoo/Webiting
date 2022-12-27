package com.product.mapper;

import java.util.List;

import com.board.model.PagingVO;
import com.product.model.CategoryVO;
import com.product.model.ProductVO;
import com.user.model.UserVO;

public interface ProductMapper {
	
	int productInsert(ProductVO vo);
	
	List<ProductVO> getProducts();
	
	List<ProductVO> selectByPspec(String pspec);
	List<ProductVO> selectByCategory(CategoryVO cvo);
	
	ProductVO selectByPnum(int pnum);
	public List<ProductVO> productListCategory(String downCg_code);	
	List<ProductVO> selectProductAllPaging(PagingVO paging);
	public int getTotalCount(PagingVO page);
}
