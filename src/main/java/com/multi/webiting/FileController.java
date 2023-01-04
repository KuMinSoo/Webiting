package com.multi.webiting;



import java.io.File;
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
		ServletContext app=req.getServletContext();
		String upDir=app.getRealPath("/resources/board_upload");
		
		String filePath=upDir+File.separator+fname;
		log.info("filePath==="+filePath);
		
		
		org.springframework.core.io.Resource resource=new FileSystemResource(filePath);
		if(!resource.exists()) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		String downName=null;
		boolean checkIE=(userAgent.indexOf("MSIE")>-1 || userAgent.indexOf("Trident")>-1);
		try {
			if(checkIE){
				downName=URLEncoder.encode(origin_fname,"UTF-8").replaceAll("\\+", " ");
			}else {		
				origin_fname=origin_fname.replace(",", "");
				downName=new String(origin_fname.getBytes("UTF-8"),"ISO-8859-1");
			}
		}catch(UnsupportedEncodingException e) {
			log.error("���� �ٿ�ε� �� ����:"+e);
		}
		
		HttpHeaders headers=new HttpHeaders();
		headers.add("Content-Disposition", "attachment; filename="+downName);
		
		return new ResponseEntity<>(resource,headers,HttpStatus.OK);
	}
}