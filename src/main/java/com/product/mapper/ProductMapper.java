package com.product.mapper;

import java.util.List;

import com.board.model.PagingVO;
import com.product.model.CategoryVO;
import com.product.model.ProductVO;
import com.product.model.SelectDTO;
import com.product.model.UpdateReplyDTO;

public interface ProductMapper {
	
	int productInsert(ProductVO vo);
	
	List<ProductVO> getProducts();
	
	List<ProductVO> selectByPspec(String pspec);
	List<ProductVO> selectByCategory(CategoryVO cvo);
	
	ProductVO selectByPnum(int pnum);

	// 상품 평점 메소드	
	static Double getRatingAverage(int pnum) {
		
		return null;
	}
	
	// 평점 업데이트 메소드 
	static void UpdateRating(UpdateReplyDTO urd) {
		
	}
	
	// 평점 순 상품 정보
	List<SelectDTO> likeSelect();
	public List<ProductVO> selectProductAllPaging(PagingVO paging);
	public List<ProductVO> productListCategory( String downCg_code);
	public int getTotalCount(PagingVO page);
}
