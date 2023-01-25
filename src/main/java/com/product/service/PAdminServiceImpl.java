package com.product.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.model.PagingVO;
import com.product.mapper.CategoryMapper;
import com.product.mapper.ProductMapper;
import com.product.model.Aitems;
import com.product.model.CategoryVO;
import com.product.model.PLikeVO;
import com.product.model.ProductVO;

import lombok.extern.log4j.Log4j;

@Service("padminServiceImpl")
@Log4j
public class PAdminServiceImpl implements PAdminService {
	
	@Inject
	private CategoryMapper categoryMapper;
	
	@Inject
	private ProductMapper productMapper;
	
	Aitems aitems=new Aitems();
	
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
	
	// 상세 페이지 PAdminservice 인터페이스 구현 클래스
	@Override
	public ProductVO detailProduct(int pnum) {
		
		return this.productMapper.detailProduct(pnum);
	}
	
	// 연관 상품 페이지 PAdminservice 인터페이스 구현 클래스
	@Override
	public List<ProductVO> relatedProduct(ProductVO vo) {
		
		return this.productMapper.relatedProduct(vo);
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

	@Override
	public int productDelete(int pnum) {
		return this.productMapper.productDelete(pnum);
	}
	@Override
	public ProductVO getProductByPnum(int pnum) {
		return this.productMapper.getProductByPnum(pnum);
	}

	@Override
	public int updateProduct(ProductVO vo) {
		return this.productMapper.updateProduct(vo);
	}

	@Override
	public int findLike(PLikeVO like) {
		return this.productMapper.findLike(like);
	}

	@Override
	public int totalLike(int pnum) {
		return this.productMapper.totalLike(pnum);
	}

	@Override
	public void likeRemove(PLikeVO vo) {
		this.productMapper.likeRemove(vo);
	}

	@Override
	public void likeUp(PLikeVO vo) {
		this.productMapper.likeUp(vo);
	}
	
	@Override
	public List<ProductVO> personalRecoProdList(int idx) {
		List<Object> list=(List<Object>) aitems.aitems("personalRecommend", idx);
		List<ProductVO> vo=new ArrayList<>();
		if(idx==1||idx==2||idx==3||idx==4) {
		for(int i=0;i<4;i++) {
			ProductVO pro=this.productMapper.detailProduct(Integer.parseInt((String) list.get(i)));
			vo.add(pro);
		}
		//log.info(list);
		return vo;
		}
		else return null;
	}

	@Override
	public List<ProductVO> topProdBed() {
		List<Object> list1=(List<Object>) aitems.aitems("pop", 1);
		List<Object> list2=(List<Object>) aitems.aitems("pop", 2);
		List<Object> list3=(List<Object>) aitems.aitems("pop", 3);
		List<ProductVO> vo=new ArrayList<>();
		boolean flag = true;
		int i = 0;
		while(flag) {
			if(i < list1.size()) {
				ProductVO pro=this.productMapper.detailProduct(Integer.parseInt((String) list1.get(i)));
				vo.add(pro);
			}else if(i < list2.size()) {
				ProductVO pro=this.productMapper.detailProduct(Integer.parseInt((String) list2.get(i)));
				vo.add(pro);
			}else if(i < list3.size()) {
				ProductVO pro=this.productMapper.detailProduct(Integer.parseInt((String) list3.get(i)));
				vo.add(pro);
			}else if(i>list1.size() && i> list2.size() && i> list3.size()) {
				
				flag = false;
			}
			i++;
		}
		List<ProductVO> vo1=new ArrayList<>();
        if(vo.size()!=0) {
        	vo1.add(vo.get(0));
        	vo1.add(vo.get(1));
        	vo1.add(productMapper.getProductByPnum(2700));
        	vo1.add(vo.get(3));
        	//log.info(vo.get(2));
        	return vo1;
        }
        else return null;
	}
	@Override
	public List<ProductVO> topProdChair() {
		List<Object> list1=(List<Object>) aitems.aitems("pop", 4);
		List<Object> list2=(List<Object>) aitems.aitems("pop", 5);
		return cate2(list1,list2);
	}
	@Override
	public List<ProductVO> topProdShelf() {
		List<Object> list1=(List<Object>) aitems.aitems("pop", 6);
		List<Object> list2=(List<Object>) aitems.aitems("pop", 7);
		return cate2(list1,list2);
	}
	@Override
	public List<ProductVO> topProdSofa() {
		List<Object> list1=(List<Object>) aitems.aitems("pop", 8);
		List<Object> list2=(List<Object>) aitems.aitems("pop", 9);
		return cate2(list1,list2);
	}
	@Override
	public List<ProductVO> topProdStorage() {
		List<Object> list1=(List<Object>) aitems.aitems("pop", 10);
		List<Object> list2=(List<Object>) aitems.aitems("pop", 11);
		List<Object> list3=(List<Object>) aitems.aitems("pop", 12);
		List<Object> list4=(List<Object>) aitems.aitems("pop", 13);
		List<ProductVO> vo=new ArrayList<>();
		
		boolean flag = true;
		int i = 0;
		while(flag) {
			if(i < list1.size()) {
				ProductVO pro=this.productMapper.detailProduct(Integer.parseInt((String) list1.get(i)));
				vo.add(pro);
			}else if(i < list2.size()) {
				ProductVO pro=this.productMapper.detailProduct(Integer.parseInt((String) list2.get(i)));
				vo.add(pro);
			}else if(i < list3.size()) {
				ProductVO pro=this.productMapper.detailProduct(Integer.parseInt((String) list3.get(i)));
				vo.add(pro);
			}else if(i < list4.size()) {
				ProductVO pro=this.productMapper.detailProduct(Integer.parseInt((String) list4.get(i)));
				vo.add(pro);
			}else if(i>list1.size() && i> list2.size() && i> list3.size() && i> list4.size()) {
				flag = false;
			}
			i++;
		}
		
		List<ProductVO> vo1=new ArrayList<>();
		
		if(vo.size()!=0) {
        	vo1.add(vo.get(0));
        	vo1.add(vo.get(1));
        	vo1.add(vo.get(2));
        	vo1.add(vo.get(3));
        	return vo1;
        }
        else return null;
	}
	@Override
	public List<ProductVO> topProdTable() {
		List<Object> list1=(List<Object>) aitems.aitems("pop", 14);
		List<Object> list2=(List<Object>) aitems.aitems("pop", 15);
		return cate2(list1,list2);
	}
	
	
	public List<ProductVO> cate2(List<Object> list1,List<Object> list2){
		List<ProductVO> vo=new ArrayList<>();
		boolean flag = true;
		int i = 0;
		while(flag) {
			if(i < list1.size()) {
				ProductVO pro=this.productMapper.detailProduct(Integer.parseInt((String) list1.get(i)));
				vo.add(pro);
			}else if(i < list2.size()) {
				ProductVO pro=this.productMapper.detailProduct(Integer.parseInt((String) list2.get(i)));
				vo.add(pro);
			}else if(i>list1.size() && i> list2.size()) {
				flag = false;
			}
			i++;
		}
		
		List<ProductVO> vo1=new ArrayList<>();
		
		if(vo.size()!=0) {
        	vo1.add(vo.get(0));
        	vo1.add(vo.get(1));
        	vo1.add(vo.get(2));
        	vo1.add(vo.get(3));
        	return vo1;
        }
        else return null;
	}

	@Override
	public List<ProductVO> getTopLike() {
		List<ProductVO> list=new ArrayList<>();
		int[] idx=this.productMapper.getTopLike();
		for(int i=0;i<4;i++) {
			ProductVO vo=this.productMapper.getProductByPnum(idx[i]);
			list.add(vo);
		}
		return list;
	}
}
