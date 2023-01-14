package com.board.model;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private String mode;  

	private String bcg_code;
	private String bcg_name;
	
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
	private String old_filename;
	
	
	private int refer;
	private int lev;
	private int adminSunbun;
	
	private String secret;
	
}