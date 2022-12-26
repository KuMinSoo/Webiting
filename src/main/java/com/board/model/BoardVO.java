package com.board.model;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private String mode;
	

	private String bcg_code;//상위 카테고리 코드
	private String bcg_name;//상위 카테고리명
	
	
	
	private int num;
	private String name;
	private String passwd;
	private String subject;
	private String content;
	
	private Date wdate;
	private int readnum;
	
	private String filename;
	private String originFilename;
	private long filesize;
	
	private int refer;
	private int lev;
	private int sunbun;
	
	private String old_filename;
	
}