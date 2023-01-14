package com.product.model;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderVO {
	
	private String title;//물품 대표 제목(ex. 가구 외 1개)
	private String ordered_no;//고유 결제번호 
	private String ordered_to_name;//회원이름
	private String ordered_to_tel;//전화번호 
	private String ordered_to_email;
	private String ordered_to_adr;
	private String ordered_to_post;
	private String ordered_payhow;// 지불방법
	private String ordered_paystate;// 결제 성공 여부
	private int ordered_orderprice;// 총금액
	private int idx;
	private Date ordered_date;// 결제날짜
	private String ordered_state;
	
}