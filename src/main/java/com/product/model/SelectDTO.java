// 상품 평점 DTO 미완성 
package com.product.model;

import java.util.List;

public class SelectDTO {
	
	/* 상품 이름 */
	private String Pname;
	
	/* 카테고리 이름 */
	private String downCg_name;
	
	private double ratingAvg;	
	
	/* 상품 이미지 */
	private List<ProductVO> pimage1;

	@Override
	public String toString() {
		return "SelectDTO [Pnum=" + Pname + ", downCg_name=" + downCg_name + ", ratingAvg=" + ratingAvg + ", pimage1="
				+ pimage1 + "]";
	}

	public String getPame() {
		return Pname;
	}

	public void setPname(String pname) {
		Pname = pname;
	}

	public String getDownCg_name() {
		return downCg_name;
	}

	public void setDownCg_name(String downCg_name) {
		this.downCg_name = downCg_name;
	}

	public double getRatingAvg() {
		return ratingAvg;
	}

	public void setRatingAvg(double ratingAvg) {
		this.ratingAvg = ratingAvg;
	}

	public List<ProductVO> getPimage1() {
		return pimage1;
	}

	public void setPimage1(List<ProductVO> pimage1) {
		this.pimage1 = pimage1;
	}
	
}
