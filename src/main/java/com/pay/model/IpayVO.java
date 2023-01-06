package com.pay.model;

import lombok.Data;

@Data
public class IpayVO {
	//결제 시스템으로 보낼 데이터
	
	private int merchant_uid;//주문번호
	private String name;//이름
	private int amount;//결제 총금액
	private String buyer_email;//이메일
	private String buyer_name;//이름
	private String buyer_tel;//연락처
	private String buyer_addr;//주소
	private String buyer_postcode;//우편번호
	
}
