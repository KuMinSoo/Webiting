package com.product.mapper;

import java.util.List;

import com.board.model.PagingVO;
import com.product.model.CategoryVO;
import com.product.model.PLikeVO;
import com.product.model.ProductVO;

public interface ProductMapper {
	
	int productInsert(ProductVO vo);
	
	List<ProductVO> getProducts();
	
	List<ProductVO> selectByPspec(String pspec);
	List<ProductVO> selectByCategory(CategoryVO cvo);
	
	ProductVO selectByPnum(int pnum);



	public List<ProductVO> selectProductAllPaging(PagingVO paging);
	public List<ProductVO> productListCategory( String downCg_code);
	public int getTotalCount(PagingVO page);
	public int getTotalCountCategory(String downCg_code);
	ProductVO detailProduct(int pnum);

	
	List<ProductVO> relatedProduct(ProductVO vo);


	int productDelete(int pnum);

	ProductVO getProductByPnum(int pnum);

	int updateProduct(ProductVO vo);


	int updateHeart(int pnum);

	int selectHeart(int pnum);

	int insertHeart(int pnum);

	int heartCount(int pnum);
	int findLike(PLikeVO like);
	int totalLike(int pnum);
	void likeRemove(PLikeVO vo);
	void likeUp(PLikeVO vo);
}
