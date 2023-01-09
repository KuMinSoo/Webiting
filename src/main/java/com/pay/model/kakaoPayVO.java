package com.pay.model;

import lombok.Data;

@Data
public class kakaoPayVO {
	String partner_order_id;//
	String partner_user_id;//
	String item_name;//
	int quantity;//
	int total_amount;//
	int tax_free_amount;//
	String approval_url;//
	String cancel_url;//
	String fail_url;//
}
