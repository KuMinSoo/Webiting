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

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board")
@Log4j
public class BoardController {
	
	@Inject
	@Qualifier(value = "boardService")
	private BoardService bService;
	
	@Inject
	private CommonUtil util;
	
	
	@GetMapping("/home")
	public String boardHome() {
		
		return "board/boardHome";
	}
	
	@GetMapping("/write")
	public String boardWrite() {
		
		return "board/boardWrite";
	}
	
	@PostMapping("/write")
	public String broadInsert(HttpServletRequest req,
			Model m, @RequestParam("mfilename") MultipartFile mfilename, 
			@ModelAttribute BoardVO board) {
		ServletContext app=req.getServletContext();
		String upDir=app.getRealPath("/resources/board_upload");
		File dir=new File(upDir);
		log.info(upDir+"-----------------sss---------");
		if(!dir.exists()) {
			dir.mkdirs();//업로드 디렉토리의 경로가 없는 경우 전체를 다 만들어줌
		}
		
		if(!mfilename.isEmpty()) {
			String originFname=mfilename.getOriginalFilename();
			long fsize=mfilename.getSize();
			
			UUID uuid=UUID.randomUUID();//파일 중복저장을 막기위한 랜덤값 설정
			String filename=uuid.toString()+"_"+originFname;//실제 업로드 시킬파일	
			try {
				mfilename.transferTo(new File(upDir,filename));//해당절대경로에 실제 업로드함
			} catch (Exception e) {
				e.printStackTrace();
			}
			log.info(upDir);
			board.setFilename(filename);//실제 저장된 파일이름
			board.setOriginFilename(originFname);//원본 파일이름
			board.setFilesize(fsize);
		}
		if(board.getName()==null||board.getSubject()==null||board.getPasswd()==null||
			board.getName().trim().isEmpty()||board.getSubject().trim().isEmpty()||board.getPasswd().isEmpty()) {
			return "redirect:write";
		}
		
		
		
		int n=0;
		String str="",loc="";
		if("write".equals(board.getMode())) {
			n=this.bService.insertBoard(board);
			str+="글쓰기 ";
		}else if("edit".equals(board.getMode())) {
			n=this.bService.updateBoard(board);
			str+="글수정 ";
		}
		
		
		
		str=(n>0)?"성공":"실패";
		loc=(n>0)?"list":"javascript:history.back()";
		
		return util.addMsgLoc(m, str, loc);
	}//--------------------------------------
	
	@PostMapping("/edit")
	public String boardEditForm(Model m, 
			@RequestParam(defaultValue = "0") int num,
			@RequestParam(defaultValue = "") String passwd) {
		if(num==0||passwd.isEmpty()) {
			return "redirect:list";
		}
		
		BoardVO vo=this.bService.selectBoardByIdx(num);
		if(vo==null) {
			return util.addMsgBack(m, "해당 글이 존재하지 않습니다.");
		}
		if(!vo.getPasswd().equals(passwd)) {
			return util.addMsgBack(m, "비밀번호가 일치하지 않습니다");
		}
		
		m.addAttribute("board", vo);
		
		return "board/boardEdit";
	}
	
	@GetMapping("/list")
	public String boardList(Model m, @ModelAttribute("page") PagingVO page,
			HttpServletRequest req, @RequestHeader("User-Agent")String userAgent){
		
		String myctx=req.getContextPath();
		HttpSession ses=req.getSession();
		
		log.info("1. page==="+page);
		int totalCount=this.bService.getTotalCount(page);
		log.info("1. totalCount======================="+totalCount);
		page.setTotalCount(totalCount);
		page.setPagingBlock(5);
		page.init(ses);
		
		log.info("2. page==="+page);
		List<BoardVO> boardArr=this.bService.selectBoardAllPaging(page);
		String loc="board/list";
		String pageNavi=page.getPageNavi(myctx, loc, userAgent);
		
		
		m.addAttribute("pageNavi",pageNavi);
		m.addAttribute("boardArr",boardArr);
		m.addAttribute("paging",page);
		
		return "board/boardList";

	}//--------------------
	
	@GetMapping("/view/{num}")
	public String boardView(@PathVariable("num") int num, Model m) {
		int n=this.bService.updateReadnum(num);
		BoardVO board=this.bService.selectBoardByIdx(num);
		m.addAttribute("board",board);
		
		return "board/boardView";
		
	}
	
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
			return util.addMsgBack(m, "해당글은 존재하지 않습니다");
		}
		String dbPwd=vo.getPasswd();
		if(!dbPwd.equals(passwd)) {
			return util.addMsgBack(m, "비밀번호가 잃치하지 않습니다");
		}
		
		int n=this.bService.deleteBoard(num);
		
		ServletContext app=req.getServletContext();
		String upDir=app.getRealPath("/resources/board_upload");
		
		if(n>0 && vo.getFilename()!=null) {
			File f=new File(upDir, vo.getFilename());
			if(f.exists()) {
				boolean b=f.delete();
				log.info("파일삭제 여부: "+b);
			}
		}
		String str=(n>0)?"삭제 성공":"삭제 실패";
		String loc=(n>0)?"list":"javascript:history.back()";
		return util.addMsgLoc(m, str, loc);
	}
	
	
	

	
	
	

	
	
	
}