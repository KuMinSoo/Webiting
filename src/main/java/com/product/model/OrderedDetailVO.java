package com.product.model;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderedDetailVO {
	
	private int orderedDetail_no;//primary key
	//보내는 상품 정보(쇼핑물 회사) 동일 
	private String orderedDetail_from_tel="1000-1000";
	private String ordered_from_adr="서울 강남구";
	private String ordered_from_post="39311";	
	private String ordered_delivnum;
	
	
	//배송상태
	private int ordered_delivstateNum_fk;
	private String orderedDetail_delivstate;
	
	
	
	//주문자 인적사항(OrderedVO_fk)	
	private int ordered_no_fk;//Ordered_fk
	private String ordered_to_tel;
	private String ordered_to_email;
	private String ordered_to_adr;
	private String ordered_to_post;	
	private Date ordered_date;
	private int ordered_orderprice;
	
	
	//아마 장바구니 vo랑 동일할 것으로 예상함.
	//주문자가 주문한 상품과 갯수(카트 vo 처럼 주문 목록vo 예상 필요변수)
	private int idx_fk;
	private String userid;
	private String name;
	
	//productvo
	private int pnum_fk;//(productVO_fk)
	private String pname;
	private int oqty;
	private int price;
	private int saleprice;
	private String pcompany;
	private int totalPrice;
	private int totalPoint;	
	//추가됨
	private String onum;//주문번호-----------	
	
	/**할인율을 반환하는 메서드*/
	public int getPercent() {
		//   (정가-판매가)*100/정가
		int percent=(price-saleprice)*100/price;
		return percent;
	}
	
	
	
	
	

	
}
