package com.board.model;



import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Data
@Log4j
public class PagingVO {
	private int cpage;//현재 페이지
	private int pageSize = 15;//페이지 기본 사이즈
	private int totalCount;//총 게시글 수
	private int pageCount;//총페이지수
	
	private int start;//페이지 시작 첫번째 글
	private int end;//페이지 끝..
	
	private int pagingBlock =10;//페이징 블럭 ex) [1][2][3]....
	private int prevBlock;//이전 페이징 블럭 그룹의 첫번째 페이지 번호
	private int nextBlock;//다음 페이징 블럭 그룹의 첫번째 페이지 번호 
	
	private String findType;// 검색유형: 글번호, 글제목, 글내용
	private String findKeyword;//페이지 키워드 입력
	
	
	public void init(HttpSession ses) {
		if(ses!=null) {
			ses.setAttribute("pageSize", pageSize);//세션을 통해 해당 페이지 수 저장
		}
		log.info("1. PagingVO totalCount======================="+pageSize);
		log.info("1. PagingVO totalCount======================="+totalCount);
		pageCount = (totalCount - 1) / pageSize + 1;
		
		if(cpage<1) {
			cpage=1;//현재 페이지에 1보다 작은 수가 입력될 경우 기본 1페이지로 지정함
		}
		
		if(cpage>pageCount) { 
			cpage=pageCount;//현재 페이지에 총페이지수보다 큰 수가 입력될 기본 마지막 페이지로 지정함 
		}
			
		start=(cpage-1)*pageSize;//현재 페이지에 시작될 게시판 첫번째 글의 시작번호
		end=start+(pageSize+1);//현재 페이지에 시작될 게시판 마지막 글의 시작번호
		
		prevBlock=(cpage-1)/pagingBlock*pagingBlock;
		nextBlock=prevBlock+(pagingBlock+1);
		
	}
	
	public String getPageNavi(String myctx,String loc, String userAgent) {
		
		if(findType==null) {//검색 기능을 사용하지 않을 경우 해당 값을 'null'을 ''로 바꾸어 서버 오류가 발생하지 않도록 함
			findType="";
			findKeyword="";
		}else {
			if(userAgent.indexOf("MSIE")>-1||userAgent.indexOf("Trident")>-1) {
				try {
					findKeyword=URLEncoder.encode(findKeyword,"UTF-8");//internet explorer 일때 parameter의 한글값이 깨질 수 있기에 깨지지 않도록 함
				} catch (UnsupportedEncodingException e) {
					System.out.println(e);
				}
			}
		}
		//페이지 블럭 처리를 Controller에서 한 후 html에 삽입함
		String str="";
		String link=myctx+"/"+loc;
		String qStr="?pageSize="+pageSize+"&findType="+findType;
				qStr+="&findKeyword"+findKeyword;
		link+=qStr;  
		StringBuilder buf=new StringBuilder();
		buf.append("<ul class='pagination justify-content-center'>");
		if(prevBlock>0) {
			buf.append("<li class='page-item'>")
				.append("<a class='page-link' href='"+link+"&cpage="+prevBlock+"'>")
				.append("Prev")
				.append("</a>")
				.append("</li>");
		}
		for(int i=prevBlock+1;i<nextBlock && i<=pageCount;i++) {
			String css=(i==cpage)?" active":"";
			
			buf.append("<li class='page-item "+css+"'>")
				.append("<a class='page-link' href='"+link+"&cpage="+i+"'>")
				.append(i)
				.append("</a>")
				.append("</li>");	
		}	
		if(nextBlock<=pageCount) {
			buf.append("<li class='page-item'>")
			.append("<a class='page-link' href='"+link+"&cpage="+nextBlock+"'>")
			.append("Next")
			.append("</a>")
			.append("</li>");	
		}
		buf.append("</ul>");
		str=buf.toString();
		return str;
	}
	
}
