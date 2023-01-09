package com.product.model;

import java.util.List;

import lombok.Data;

@Data
public class OrderVO {
	private String onum;
	private int pnum;
	private int idx;
	private int saleprice;
	private int oqty;
	private String pimage;
	private int opoint;
	
	private int totalPrice;
	private int totalPoint;
	private List<ProductVO> orderList;
	
}