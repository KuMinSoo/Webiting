package com.multi.webiting;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.model.PagingVO;
import com.common.CommonUtil;
import com.user.model.UserVO;
import com.user.service.AdminService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {
	@Inject
	@Qualifier(value="AdminServiceImpl")
	private AdminService aService;
	
	CommonUtil common = new CommonUtil();
	
	@GetMapping("/userList_old")
	public String userList(Model m) {
		int totalCount=aService.getTotalCount();
		//List<UserVO> arr=aService.listUser();
		
		//m.addAttribute("userArr",arr);		
		m.addAttribute("totalCount",totalCount);
		
		return "member/userlist";
	}
	
	//PagingVO�� getPageNavi()�߰� (paging java�� ó��)�� �˻� ��� �߰�
	@GetMapping("/userList")
	public String userListPaging(Model m, @ModelAttribute("page") PagingVO page,
			HttpServletRequest req, @RequestHeader("User-Agent") String userAgent) {
		String myctx=req.getContextPath();
		
		HttpSession ses=req.getSession();
		
		log.info("1. page===="+page);
		int totalCount=this.aService.getTotalCount(page);
		page.setTotalCount(totalCount);
		page.setPagingBlock(5);
		page.init(ses);
		
		log.info("2. page===="+page);
		List<UserVO> userArr=this.aService.selectUserAllPaging(page);
		log.info(userArr);
		String loc="admin/userList";
		String pageNavi=page.getPageNavi(myctx, loc, userAgent);
		
		m.addAttribute("pageNavi", pageNavi);
		m.addAttribute("paging", page);
		m.addAttribute("userArr", userArr);
		return "member/userlist";
		
	}
	
	
	@PostMapping("/userDel")
	public String userDelete(Model m, @RequestParam(defaultValue="0") int idx) {
		log.info("idx==="+idx);
		
		if(idx==0) {
			return "redirect:userList";
		}
		
		UserVO vo=this.aService.selectUserByIdx(idx);
		if(vo==null) {
			return common.addMsgBack(m, "�ش� ȸ���� �������� �ʽ��ϴ�.");
		}
		
		int n=aService.deleteUser(idx);
		
		String str=(n>0)?"���� �Ǿ����ϴ�.":"ȸ�� ���� ����";
		String loc=(n>0)?"userList":"javascript:history.back()";
		
		return common.addMsgLoc(m, str, loc);
	}
	
	@PostMapping("/userEdit")
	public String userEdit(Model m, @RequestParam(defaultValue="0") int idx) {
		log.info("idx==="+idx);
		
		if(idx==0) {
			return "redirect:userList";
		}
		
		UserVO vo=this.aService.selectUserByIdx(idx);
		if(vo==null) {
			return common.addMsgBack(m, "�ش� ȸ���� �������� �ʽ��ϴ�.");
		}
		
		m.addAttribute("user", vo);
		
		return "member/editform";
	}	
	
	@PostMapping("/edit")
	public String editEnd(Model m, @ModelAttribute("user") UserVO user) {
		log.info("edit==="+user);
		if(user.getName()==null||user.getUserid()==null||user.getPwd()==null||
				user.getName().trim().isEmpty()||user.getUserid().trim().isEmpty()||user.getPwd().trim().isEmpty()) {
			return "redirect:join";
		}
		
		int n=aService.updateUser(user);
		String str=(n>0)?"ȸ������ �Ϸ�":"���� ����";
		String loc=(n>0)?"userList":"javascript:history.back()";
		
		m.addAttribute("message", str);
		m.addAttribute("loc", loc);
		return "msg";
	}
	
}