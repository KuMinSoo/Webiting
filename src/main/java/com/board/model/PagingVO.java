package com.board.model;




import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import lombok.Data;
import lombok.extern.log4j.Log4j;


@Data
@Log4j
public class PagingVO {
	private int cpage;
	private int pageSize = 15;
	private int totalCount;
	private int pageCount;
	private Integer sortType=1;

	
	private int start;//
	private int end;//
	
	private int pagingBlock =10;
	private int prevBlock;
	private int nextBlock;
	
	private String findType;
	private String findKeyword;

	private int idx;	
	private String orderMode;
	private String orderStatusMode;
	private String dateStart;
	private String dateEnd;
	
	
	public void init(HttpSession ses) {
		if(ses!=null) {
			ses.setAttribute("pageSize", pageSize);
		}
		//log.info("1. PagingVO totalCount======================="+pageSize);
		//log.info("1. PagingVO totalCount======================="+totalCount);
		pageCount = (totalCount - 1) / pageSize + 1;
		
		if(cpage<1) {
			cpage=1;
		}
		
		if(cpage>pageCount) { 
			cpage=pageCount;
		}
			
		start=(cpage-1)*pageSize;
		end=start+(pageSize+1);
		
		prevBlock=(cpage-1)/pagingBlock*pagingBlock;
		nextBlock=prevBlock+(pagingBlock+1);
		
	}
	
	public String getPageNavi(String myctx,String loc, String userAgent) {
		
		if(dateStart==null || dateEnd==null) {
			dateStart="";
			dateEnd="";
		}
		if(orderStatusMode==null) {
			orderStatusMode="";	
		}
		
		if(orderMode==null) {
			orderMode="";
		}
		
		if(findType==null) {
			findType="";
			findKeyword="";			
		}else {
			if(userAgent.indexOf("MSIE")>-1||userAgent.indexOf("Trident")>-1) {
				try {
					findKeyword=URLEncoder.encode(findKeyword,"UTF-8");
				} catch (UnsupportedEncodingException e) {
					System.out.println(e);
				}
			}
		}
		
		String str="";
		String link=myctx+"/"+loc;

		String qStr="?pageSize="+pageSize+"&findType="+findType;
				qStr+="&findKeyword="+findKeyword+"&sortType="+sortType;
				qStr+="&orderMode="+orderMode+"&orderStatusMode="+orderStatusMode;
				qStr+="&dateStart="+dateStart+"&dateStartEnd="+dateEnd;
		

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
		System.out.println(link);
		return str;
	}

	
}
