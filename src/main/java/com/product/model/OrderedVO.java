package com.product.model;

import java.sql.Date;

import lombok.Data;

@Data//결제 관련 vo
public class OrderedVO {
	

	private int orderedNum;//primary key

	private String ordered_from_tel="1000-1000";
	private String ordered_from_adr="서울 강남";
	private String ordered_from_post="39311";	
	
	
	//배송정보
	private int ordered_delivstateNum_fk;
	private String ordered_delivstate;

	//받는 사람 정보(기본정보랑 동일할수도 아닐수도 있음
	private String ordered_no;//
	private String ordered_to_name;
	private String ordered_to_tel;
	private String ordered_to_email;
	private String ordered_to_adr;
	private String ordered_to_post;
	private String ordered_payhow;//지불방법
	private String ordered_paystate;//결제 성공 여부
	private int ordered_orderprice;//총금액
	private Date ordered_date;//결제날짜
	
	//사용자 정보
	private int idx_fk;
	private String userid;

	
	//productvo 상품정보
	private int pnum_fk;//(productVO_fk)
	private String pname;
	private int oqty;
	private int price;
	private int saleprice;
	private String pimage;
	private String pcompany;
	private int totalPrice;
	private int totalPoint;	
	private String onum;//상품번호
	
	
	public int getPercent() {

		int percent=(price-saleprice)*100/price;
		return percent;
	}
	


	
}
