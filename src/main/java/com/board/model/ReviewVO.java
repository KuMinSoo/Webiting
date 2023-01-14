package com.board.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	private String mode;
	private int revnum; //리뷰 글번호
	private String rtitle; // 제목
	private String content; //내용,문의
	private String revwriter;// 작성자
	private Date wdate; // 리뷰 등록 날짜 
	private Date rupdate; 
	private int pnum_fk; // 리뷰 상품
	private int star; //별점
	private int revread; //조회수
}