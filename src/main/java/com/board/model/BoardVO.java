package com.board.model;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private String mode;  

	private String bcg_code;//게시판 문의글 코드번호
	private String bcg_name;//게시판 문의글 코드 이름
	
	private int num;//고유게시판 글번호
	private String name;//게시판 글이름
	private String passwd;//게시판 비밀번호
	private String subject;//게시판 제목
	private String content;//게시판 내용
	
	private Date wdate;//작성한 날짜(현재 시간)
	private int readnum;//조회수
	
	private String filename;//파일 경로에 중복 저장을 막기 위한 파일이름(랜덤값+파일원본이름)
	private String originFilename;//파일 원본 이름
	private long filesize;//파일 사이즈
	private String old_filename;//수정하여 파일 추가시 이전 파일 이름을 저장할 변수
	
	
	private int refer;//게시판 부모번호(게시판 리스트 정렬시 기준이됨)
	private int lev;//게시판 부모번호에 따른 답변번호(게시판 리스트 정렬시 기준이됨)
	private int adminSunbun;//공지사항 순서
	
	
	
	private String secret;//비밀글 설정
	
}