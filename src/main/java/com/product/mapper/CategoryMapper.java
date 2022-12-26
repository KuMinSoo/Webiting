package com.product.mapper;

import java.util.List;

import com.product.model.CategoryVO;
public interface CategoryMapper {
	
	public List<CategoryVO> getUpcategory();
	
	public List<CategoryVO> getDowncategory(String upCg_code);
	
	public int categoryAdd(CategoryVO cvo);
	public int categoryDelete(int cg_code);

}
