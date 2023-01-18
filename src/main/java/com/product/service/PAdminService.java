package com.product.service;

import java.util.List;

import com.board.model.PagingVO;
import com.product.model.CategoryVO;
import com.product.model.PLikeVO;
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
	
	//연관 상품 페이지 인터페이스
	public List<ProductVO> relatedProduct(ProductVO vo);


	public int productDelete(int pnum);

	public ProductVO getProductByPnum(int pnum);

	public int updateProduct(ProductVO vo);

	
	
	public int findLike(PLikeVO like);

	public int totalLike(int pnum);

	public void likeRemove(PLikeVO vo);

	public void likeUp(PLikeVO vo);

	public List<ProductVO> personalRecoProdList(int idx);


	public List<ProductVO> topProdBed();

	List<ProductVO> topProdChair();

	List<ProductVO> topProdShelf();

	List<ProductVO> topProdSofa();

	List<ProductVO> topProdStorage();

	List<ProductVO> topProdTable();

	public List<ProductVO> getTopLike();



}