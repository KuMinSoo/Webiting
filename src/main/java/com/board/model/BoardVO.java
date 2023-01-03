package com.board.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardVO {
	
	private String mode;  
	

	private String bcg_code;//���� ī�װ� �ڵ�
	private String bcg_name;//���� ī�װ���
	
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
	
	private String secret;//��б� ����
	
}