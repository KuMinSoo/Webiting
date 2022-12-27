/* 상품 평점 DTO*/
package com.product.model;

public class UpdateReplyDTO {

	private int pnum;
	
	private double ratingAvg;
	
	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public double getRatingAvg() {
		return ratingAvg;
	}

	public void setRatingAvg(double ratingAvg) {
		this.ratingAvg = ratingAvg;
	}
	
	@Override
	public String toString() {
		return "UpdateReplyDTO [pnum=" + pnum + ", ratingAvg=" + ratingAvg + "]";
	}
}
