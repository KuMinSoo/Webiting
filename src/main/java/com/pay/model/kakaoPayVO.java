package com.pay.model;

import lombok.Data;

@Data
public class kakaoPayVO {
	String partner_order_id;//주문번호
	String partner_user_id;//회원 아이디
	String item_name;//총 물품 이름(예시: 고구마 외 10건)
	int quantity;//상품 수량
	int total_amount;//상품총액
	int tax_free_amount;//상품 비과세
	String approval_url;//결제 성공시 url
	String cancel_url;//결제 취소시url
	String fail_url;//결제 실패시 url
}
