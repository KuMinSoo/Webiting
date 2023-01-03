package com.multi.webiting;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.board.model.BoardVO;
import com.board.model.PagingVO;
import com.board.service.BoardService;
import com.common.CommonUtil;
import com.user.model.UserVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board")
@Log4j
public class BoardController {
	
	@Inject
	@Qualifier(value = "boardServiceImpl") 
	private BoardService bService;
	
	@Inject
	private CommonUtil util;
	
	
	@GetMapping("/home")//°í°´¹®ÀÇ ¸ÞÀÎ °Ô½ÃÆÇ
	public String boardHome() {
		return "board/boardHome";
	}
	
	@GetMapping("/write")
	public String boardWrite() {
		return "board/boardWrite";
	}
	//±Û ÀÛ¼º/ÆíÁý/´ä±Û ÄÁÆ®·Ñ·¯
	@PostMapping("/write")
	public String broadInsert(HttpServletRequest req, HttpSession session,
			Model m, @RequestParam("mfilename") MultipartFile mfilename, 
			@ModelAttribute BoardVO board) {
		ServletContext app=req.getServletContext();
		String upDir=app.getRealPath("/resources/board_upload");
		File dir=new File(upDir);//ÀúÀå°æ·Î
		log.info(upDir+"-----------------sss---------");
		if(!dir.exists()) {
			dir.mkdirs();//ï¿½ï¿½ï¿½Îµï¿½ ï¿½ï¿½ï¿½ä¸®ï¿½ï¿½ ï¿½ï¿½Î°ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ ï¿½ï¿½Ã¼ï¿½ï¿½ ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
		}
		
		if(!mfilename.isEmpty()) {
			String originFname=mfilename.getOriginalFilename();//mfilename¿¡¼­ ¿øº» ÆÄÀÏ ÀÌ¸§ ÃßÃâÇÏ±â
			long fsize=mfilename.getSize();//ÆÄÀÏ »çÀÌÁî
			
			UUID uuid=UUID.randomUUID();//ï¿½ï¿½ï¿½ï¿½ ï¿½ßºï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
			String filename=uuid.toString()+"_"+originFname;//ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½Îµï¿½ ï¿½ï¿½Å³ï¿½ï¿½ï¿½ï¿½	
			
			if(board.getMode().equals("edit")&& board.getOld_filename()!=null) {
				//ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½Îµï¿½ï¿½ß´ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ Ã³ï¿½ï¿½
				File delF=new File(upDir, board.getOld_filename());
				if(delF.exists()) {
					boolean b=delF.delete();
<<<<<<< HEAD
					log.info("old fileï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½: "+b);
				} 
				
=======
					log.info("old file»èÁ¦¿©ºÎ: "+b);
				}
>>>>>>> origin/êµ¬ë¯¼ìˆ˜
			}
				
			try {
				mfilename.transferTo(new File(upDir,filename));//ï¿½Ø´ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Î¿ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½Îµï¿½ï¿½ï¿½
			} catch (Exception e) {
				e.printStackTrace();
			}
			log.info(upDir);
<<<<<<< HEAD
			board.setFilename(filename);//ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½Ì¸ï¿½
			board.setOriginFilename(originFname);//ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½Ì¸ï¿½
			board.setFilesize(fsize);
=======
			board.setFilename(filename);//½ÇÁ¦ ÀúÀåµÈ ÆÄÀÏÀÌ¸§(·£´ý°ª+¿øº»ÆÄÀÏ ÀÌ¸§)
			board.setOriginFilename(originFname);//¿øº» ÆÄÀÏÀÌ¸§
			board.setFilesize(fsize);//ÆÄÀÏ »çÀÌÁî
>>>>>>> origin/êµ¬ë¯¼ìˆ˜
		}
		
		
		//Á¦¸ñ, ÀÛ¼ºÀÚ, ºñ¹Ð¹øÈ£ ÀÔ·ÂÇÏÁö ¾ÊÀ» ½Ã ´Ù½Ã ÀÔ·ÂÃ¢ º¸¿©ÁÖ±â
		if(board.getName()==null||board.getSubject()==null||board.getPasswd()==null||
			board.getName().trim().isEmpty()||board.getSubject().trim().isEmpty()||board.getPasswd().isEmpty()) {
			return "redirect:rewrite";
		}	
		log.info("before====================="+board);
		UserVO loginUser=loginCheck(session);//¼¼¼Ç¿¡¼­ ·Î±×ÀÎ Á¤º¸¸¦ °¡Á®¿Â´Ù-> Â÷ÈÄ ·Î±×ÀÎ Á¤º¸¸¦ ºñ±³ÇÏ¿© °Ô½Ã±Û Á¢±Ù ¹üÀ§¸¦ ¼³Á¤ÇÏ±â ÇÊ¿äÇÔ
		int n=0;
		String str="",loc="";
		if("write".equals(board.getMode())) {
<<<<<<< HEAD
			n=this.bService.insertBoard(board);
			str+="ï¿½Û¾ï¿½ï¿½ï¿½ ";
		}else if("edit".equals(board.getMode())) {
			n=this.bService.updateBoard(board);
			str+="ï¿½Û¼ï¿½ï¿½ï¿½ ";
=======
			n=this.bService.insertBoard(board);//±ÛÀÛ¼º	
			str+="±Û¾²±â ";
		}else if("edit".equals(board.getMode())) {
			n=this.bService.updateBoard(board);//ÇØ´ç ±Û ¼öÁ¤
			str+="±Û¼öÁ¤ ";
			log.info("before====================="+board);
>>>>>>> origin/êµ¬ë¯¼ìˆ˜
		}else if("rewrite".equals(board.getMode())) {
			//´äº¯Àº °ü¸®ÀÚ¸¸ Á¢±ÙÇÒ ¼ö ÀÖÀ¸¸ç boardView.jsp¿¡¼­ °ü¸®ÀÚ¸¸ Á¢±ÙÇÒ ¹öÆ° ¸¸µë. ÀÌ¿¡ °ü¸®ÀÚ È®ÀÎ Á¶°ÇÀ» ºÙÀÌÁö ¾Ê¾ÒÀ½
			n=this.bService.rewriteBoard(board);
			str+="ï¿½äº¯ ";
		}
<<<<<<< HEAD

		str+=(n>0)?"ï¿½ï¿½ï¿½ï¿½":"ï¿½ï¿½ï¿½ï¿½";
=======
		
		str+=(n>0)?"¼º°ø":"½ÇÆÐ";
>>>>>>> origin/êµ¬ë¯¼ìˆ˜
		loc=(n>0)?"list":"javascript:history.back()";
				
		m.addAttribute("loginUser",loginUser);
		
		return util.addMsgLoc(m, str, loc);
	}//--------------------------------------
	
	//¼¼¼Ç¿¡¼­ ·Î±×ÀÎ Á¤º¸¸¦ °¡Á®¿Â´Ù.
	public static UserVO loginCheck(HttpSession session) {
		UserVO loginUser=(UserVO)session.getAttribute("loginUser");
		return loginUser;
	}
	
	//ºñ¹Ð¹øÈ£ Ã¼Å© ÈÄ ±Û ¼öÁ¤ÇÏ´Â jsp·Î ÀÌµ¿
	@PostMapping("/edit")
	public String boardEditForm(Model m, 
			@RequestParam(defaultValue = "0") int num,
			@RequestParam(defaultValue = "") String passwd) {
		if(num==0||passwd.isEmpty()) {
			return "redirect:list";
		}
		
		BoardVO vo=this.bService.selectBoardByIdx(num);
		if(vo==null) {
			return util.addMsgBack(m, "ï¿½Ø´ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ê½ï¿½ï¿½Ï´ï¿½.");
		}
		if(!vo.getPasswd().equals(passwd)) {
			return util.addMsgBack(m, "ï¿½ï¿½Ð¹ï¿½È£ï¿½ï¿½ ï¿½ï¿½Ä¡ï¿½ï¿½ï¿½ï¿½ ï¿½Ê½ï¿½ï¿½Ï´ï¿½");
		}
		
		m.addAttribute("board", vo);
		
		return "board/boardEdit";
	}
	
	//±Û¸ñ·Ï ÄÁÆ®·Ñ·¯
	@GetMapping("/list")
	public String boardList(Model m, @ModelAttribute("page") PagingVO page,
			HttpSession session,
			HttpServletRequest req, @RequestHeader("User-Agent")String userAgent){
		
		String myctx=req.getContextPath();
		HttpSession ses=req.getSession();
		
		log.info("1. page==="+page);
		int totalCount=this.bService.getTotalCount(page);
		log.info("1. totalCount======================="+totalCount);
		page.setTotalCount(totalCount);
		page.setPagingBlock(5);
		page.init(ses);//±âº» ÆäÀÌÁö °ª ¼³Á¤
		
		log.info("2. page==="+page);
		List<BoardVO> boardArr=this.bService.selectBoardAllPaging(page);//±Û ¸ñ·Ï È£Ãâ
		String loc="board/list";
		String pageNavi=page.getPageNavi(myctx, loc, userAgent);//ÆäÀÌÂ¡ ºí·° Ã³¸® ÇÔ¼ö
		
		UserVO loginUser=loginCheck(session);
		m.addAttribute("loginUser",loginUser);
		m.addAttribute("pageNavi",pageNavi);
		m.addAttribute("boardArr",boardArr);
		m.addAttribute("paging",page);
		
		return "board/boardList";

	}//--------------------

	//°Ô½ÃÆÇ ºäÆäÀÌÁö ÄÁÆ®·Ñ·¯
	@GetMapping("/view/{num}")
	public String boardView(@PathVariable("num") int num, Model m,HttpSession session) {
		this.bService.updateReadnum(num);
		BoardVO board=this.bService.selectBoardByIdx(num);//±Û¹øÈ£¸¦ ÅëÇØ ÇØ´ç °Ô½Ã±Û Á¤º¸ È£Ãâ
	
		UserVO loginUser=loginCheck(session);
		m.addAttribute("loginUser",loginUser);
		m.addAttribute("board",board);
		log.info("==============111"+board);
		return "board/boardView";		
	}
	
	//ºñ¹Ð±Û È®ÀÎ ÄÁÆ®·Ñ·¯(ºñ¹Ð±Û ºñ¹Ð¹øÈ£ ÀÏÄ¡ ¿©ºÎ ÆÇ´Ü ÈÄ ÇØ´ç jsp·Î ÀÌµ¿ÇÔ)
	@PostMapping("/pwdCheck")
	public String pwdCheck(@RequestParam(defaultValue = "") String passwd,int num,Model m) {
		System.out.println(passwd+"<<<<1");
		BoardVO board=this.bService.selectBoardByIdx(num);//ÇØ´ç ±ÛÁ¤º¸ È£Ãâ	
		System.out.println(board.getPasswd()+"<<<<2");
		
		if(board.getPasswd().equals(passwd)) {			
			return "redirect:/board/view/"+num; //ºñ¹Ð¹øÈ£ ÀÏÄ¡
		}else{
<<<<<<< HEAD
		return util.addMsgBack(m,"ï¿½ï¿½Ð¹ï¿½È£ï¿½ï¿½ ï¿½ï¿½Ä¡ï¿½ï¿½ï¿½ï¿½ ï¿½Ê½ï¿½ï¿½Ï´ï¿½");	
=======
		return util.addMsgBack(m,"ºñ¹Ð¹øÈ£°¡ ÀÏÄ¡ÇÏÁö ¾Ê½À´Ï´Ù");	//ºñ¹Ð¹øÈ£ ºÒÀÏÄ¡
>>>>>>> origin/êµ¬ë¯¼ìˆ˜
		}
	}
	
	
<<<<<<< HEAD
	@PostMapping("/admin/delete")
	public String adminBoardDelete(Model m, 
			HttpServletRequest req,
			@RequestParam(defaultValue = "0") int num,
			@RequestParam(defaultValue = "") String passwd) {
		
		BoardVO vo=this.bService.selectBoardByIdx(num);
		if(vo==null) {
			return util.addMsgBack(m, "ï¿½Ø´ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ê½ï¿½ï¿½Ï´ï¿½");
		}
		int n=this.bService.deleteBoard(num);
		
		ServletContext app=req.getServletContext();
		String upDir=app.getRealPath("/resources/board_upload");
		
		if(n>0 && vo.getFilename()!=null) {
			File f=new File(upDir, vo.getFilename());
			if(f.exists()) {
				boolean b=f.delete();
				log.info("ï¿½ï¿½ï¿½Ï»ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½: "+b);
			}
		}
		String str=(n>0)?"ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½":"ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½";
		String loc=(n>0)?"list":"javascript:history.back()";
		return util.addMsgLoc(m, str, loc);
	}
	
	
=======
	//È¸¿ø »èÁ¦ ±â´É(ºñ¹Ð¹øÈ£ ÀÏÄ¡¿©ºÎ ÆÇ´Ü ÈÄ »èÁ¦ÇÔ)
>>>>>>> origin/êµ¬ë¯¼ìˆ˜
	@PostMapping("/delete")
	public String boardDelete(Model m, 
			HttpServletRequest req,
			@RequestParam(defaultValue = "0") int num,
			@RequestParam(defaultValue = "") String passwd) {
			
		
		if(num==0||passwd.isEmpty()) {
			return "redirect:list";
		}
		BoardVO vo=this.bService.selectBoardByIdx(num);
		if(vo==null) {
			return util.addMsgBack(m, "ï¿½Ø´ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ê½ï¿½ï¿½Ï´ï¿½");
		}
		String dbPwd=vo.getPasswd();
		if(!dbPwd.equals(passwd)) {
			return util.addMsgBack(m, "ï¿½ï¿½Ð¹ï¿½È£ï¿½ï¿½ ï¿½ï¿½Ä¡ï¿½ï¿½ï¿½ï¿½ ï¿½Ê½ï¿½ï¿½Ï´ï¿½");
		}
		
		int n=this.bService.deleteBoard(num);
		
		ServletContext app=req.getServletContext();
		String upDir=app.getRealPath("/resources/board_upload");
		
		if(n>0 && vo.getFilename()!=null) {
			File f=new File(upDir, vo.getFilename());
			if(f.exists()) {
				boolean b=f.delete();
				log.info("ï¿½ï¿½ï¿½Ï»ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½: "+b);
			}
		}
		String str=(n>0)?"ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½":"ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½";
		String loc=(n>0)?"list":"javascript:history.back()";
		return util.addMsgLoc(m, str, loc);
	}
	

	
	
	

	
	
	
}