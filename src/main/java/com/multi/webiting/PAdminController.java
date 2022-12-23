package com.multi.webiting;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.product.model.CategoryVO;
import com.product.model.ProductVO;
import com.product.service.PAdminService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class PAdminController {
	
	@Inject
	@Qualifier(value="padminService")
	private PAdminService adminService;
	
	@GetMapping("/prodForm")
	public String productForm(Model m) {
		List<CategoryVO> upCgList=adminService.getUpcategory();
		log.info("upCgList=="+upCgList);
		m.addAttribute("upCgList", upCgList);
		
		return "/admin/prodForm";
	}
	//ajax占쏙옙청占쏙옙 占쏙옙占쏙옙 json占쏙옙占쏙옙 占쏙옙占썰데占쏙옙占싶몌옙 占쏙옙占쏙옙占쏙옙
	@GetMapping(value="/getDownCategory", produces = "application/json")
	@ResponseBody
	public List<CategoryVO> getDownCategory(@RequestParam("upCg_code") String upCg_code){
		log.info("upCg_code==="+upCg_code);
		List<CategoryVO> downCgList=adminService.getDowncategory(upCg_code);
		log.info("ssssss"+downCgList.size());
		return downCgList;
	}
	
	@PostMapping("/prodInsert")
	public String productRegister(Model m,
			@RequestParam("pimage")List<MultipartFile> pimage,
			@ModelAttribute("product") ProductVO product, //pimage1,pimage2,pimage3
			HttpServletRequest req) {		
		log.info("product===="+product);
		//1. 占쏙옙占싸듸옙 占쏙옙占썰리 占쏙옙占쏙옙占쏙옙 占쏙옙占�
		ServletContext app=req.getServletContext();
		String upDir=app.getRealPath("/resources/product_images");
		log.info("upDir==="+upDir);
		
		File dir=new File(upDir);
		if(!dir.exists()) {
			dir.mkdirs();//占쏙옙占싸듸옙占쏙옙 占쏙옙占썰리 占쏙옙占쏙옙
		}
		//2. 占쏙옙占싸듸옙 처占쏙옙
		if(pimage!=null) {
			for(int i=0;i<pimage.size();i++) {
				MultipartFile mfile=pimage.get(i);
				if(!mfile.isEmpty()) {//첨占쏙옙占쏙옙占쏙옙占쏙옙 占쌍다몌옙
					try {
						mfile.transferTo(new File(upDir,mfile.getOriginalFilename()));
						//占쏙옙占싸듸옙 처占쏙옙
						if(i==0) {
							product.setPimage1(mfile.getOriginalFilename());
						}else if(i==1) {
							product.setPimage2(mfile.getOriginalFilename());
						}else if(i==2) {
							product.setPimage3(mfile.getOriginalFilename());
						}
						
					} catch (IOException e) {						
						log.error("占쏙옙占쏙옙 占쏙옙占싸듸옙 占쏙옙占쏙옙: "+e);
					}
					
				}
			}//for---------------
			log.info("占쏙옙占싸듸옙 占쏙옙占쏙옙 product==="+product);
		}
		int n=adminService.productInsert(product);
		String str=(n>0)?"占쏙옙품占쏙옙占� 占쏙옙占쏙옙":"占쏙옙占� 占쏙옙占쏙옙";
		String loc=(n>0)?"prodList":"javascript:history.back()";
		
		m.addAttribute("message",str);
		m.addAttribute("loc",loc);
		return "msg";
	}//------------------------------------------
	
	@GetMapping("/prodList")
	public String productList(Model m) {
		
		List<ProductVO> prodArr=adminService.productList();
		m.addAttribute("prodArr",prodArr);
		
		return "admin/prodList";
	}
}

