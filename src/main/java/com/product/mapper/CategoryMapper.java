package com.product.mapper;

import java.util.List;

import com.product.model.CategoryVO;
//datasource-context.xml�� mybatis-spring:scan�����ϸ� XXXMapper�������̽��� ������ ��ü(Proxy)�� �������� ��� ������ش�
public interface CategoryMapper {
	
	public List<CategoryVO> getUpcategory();
	
	public List<CategoryVO> getDowncategory(String upCg_code);
	
	public int categoryAdd(CategoryVO cvo);
	public int categoryDelete(int cg_code);

}
