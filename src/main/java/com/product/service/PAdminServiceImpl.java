package com.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.model.PagingVO;
import com.product.mapper.CategoryMapper;
import com.product.mapper.ProductMapper;
import com.product.model.CategoryVO;
import com.product.model.ProductVO;
import com.product.model.UpdateReplyDTO;

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
	
	//  상품 평점
	public void setRating(int pnum) {
		
		Double ratingAvg = ProductMapper.getRatingAverage(pnum);
		
		if(ratingAvg == null) {
			ratingAvg = 0.0;
		}
		
		ratingAvg = (double) (Math.round(ratingAvg*10));
		ratingAvg = ratingAvg / 10;
		
		UpdateReplyDTO urd = new UpdateReplyDTO();
		urd.setPnum(pnum);
		urd.setRatingAvg(ratingAvg);		
	
		ProductMapper.UpdateRating(urd);		
	}

	@Override
	public List<ProductVO> productListCategory( String downCg_code) {
		return this.productMapper.productListCategory(downCg_code);
	}

	@Override
	public List<ProductVO> selectProductAllPaging(PagingVO paging) {
		return this.productMapper.selectProductAllPaging(paging);
	}

	@Override
	public int getTotalCount(PagingVO page) {
		return this.productMapper.getTotalCount(page);
	}

	@Override
	public int getTotalCountCategory(String downCg_code) {
		
		return this.productMapper.getTotalCountCategory(downCg_code);
	}

}
