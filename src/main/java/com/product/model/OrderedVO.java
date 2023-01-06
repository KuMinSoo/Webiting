package com.product.model;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderedVO {
	
	private int oNum;
	private int ordered_no;//---결제번호
	private String ordered_to_name;
	private String ordered_to_tel;
	private String ordered_to_email;
	private String ordered_to_adr;
	private String ordered_to_post;
	private String ordered_payhow;
	private String ordered_paystate;
	private int ordered_orderprice;
	private String ordered_date;
	private String ordered_state;
	//주문vo
	private int idx_fk;
	private String userid;


	
}
