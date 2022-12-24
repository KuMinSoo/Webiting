package com.product.model;

import lombok.Data;

@Data
public class CartVO {
	private int cartNum;//��ٱ��Ϲ�ȣ
	private int idx_fk;//ȸ����ȣ
	private int pnum_fk;//��ǰ��ȣ
	private int oqty;//����
	private java.sql.Date indate;
	
	//��ٱ��� ��ǰ����----
	private String pname;
	private String pimage1;
	private int price;
	private int saleprice;
	private int point;
	
	private int totalPrice;//saleprice*oqty =>���� ��ǰ�� �ѱݾ�
	private int totalPoint;//point*oqty => ���� ��ǰ�� ����������Ʈ
	
	private int cartTotalPrice;//��ٱ��Ͽ� ���� ��� ��ǰ�� �Ѿ�
	private int cartTotalPoint;
  
}////////////////////////