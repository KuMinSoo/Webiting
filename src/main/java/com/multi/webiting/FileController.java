package com.multi.webiting;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
//import org.springframework.core.io.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import lombok.extern.log4j.Log4j;



@Controller
@Log4j
public class FileController {
	
	
	@PostMapping(value="/fileDown", produces = "application/octet-stream")
	@ResponseBody
	public ResponseEntity<org.springframework.core.io.Resource> fileDownload(
			HttpServletRequest req,
			@RequestHeader("User-Agent") String userAgent,
			@RequestParam("fname") String fname,
			@RequestParam("origin_fname") String origin_fname){
		log.info("userAgent==="+userAgent);
		log.info("fname==="+fname);
		log.info("origin_fname==="+origin_fname);
		//1. 업로드된 디렉토리 절대경로 얻기
		ServletContext app=req.getServletContext();
		String upDir=app.getRealPath("/resources/board_upload");
		
		String filePath=upDir+File.separator+fname;
		log.info("filePath==="+filePath);
		
		
		org.springframework.core.io.Resource resource=new FileSystemResource(filePath);//uuid_파일명
		//FileSystemResource 가 알아서 파일과 스트림 연결을 한다
		if(!resource.exists()) {
			//해당 파일이 없다면
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		//2. 브라우저별 인코딩 처리
		String downName=null;
		boolean checkIE=(userAgent.indexOf("MSIE")>-1 || userAgent.indexOf("Trident")>-1);
		try {
			if(checkIE){
				//IE인 경우
				downName=URLEncoder.encode(origin_fname,"UTF-8").replaceAll("\\+", " ");
			}else {		
				//그외 브라우저인 경우
				origin_fname=origin_fname.replace(",", "");//크롬은 파일명에 콤마(,) 있으면 다운로드 되지 않음
				downName=new String(origin_fname.getBytes("UTF-8"),"ISO-8859-1");
			}
		}catch(UnsupportedEncodingException e) {
			log.error("파일 다운로드 중 에러:"+e);
		}
		
		//3. HttpHeader통해 헤더 정보 설정
		HttpHeaders headers=new HttpHeaders();
		headers.add("Content-Disposition", "attachment; filename="+downName);
		
		return new ResponseEntity<>(resource,headers,HttpStatus.OK);
	}
}
