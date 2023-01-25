package com.multi.webiting;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.user.model.DitchVO;
import com.user.model.UserVO;
import com.user.service.AdminService;
import com.user.service.MyPageService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService bService;
	
	@Inject 
	@Qualifier(value="MyPageServiceImpl")
	private MyPageService mService;
	
	@Autowired
	private CommonUtil util;
	
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
			return common.addMsgBack(m, "해당 회원이 없습니다.");
		}
		
		int n=aService.deleteUser(vo.getIdx());
		
		String str=(n>0)?"회원 삭제 성공.":"회원 삭제 실패";
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
			return common.addMsgBack(m, "해당 회원이 없습니다.");
		}
		
		m.addAttribute("user", vo);
		
		return "member/editform";
	}	
	@GetMapping("/userEdit/{idx}")
	public String userEdit2(Model m, @PathVariable(name="idx") int idx) {
		log.info("idx==="+idx);
		
		if(idx==0) {
			return "redirect:userList";
		}
		
		UserVO vo=this.aService.selectUserByIdx(idx);
		if(vo==null) {
			return common.addMsgBack(m, "해당 회원이 없습니다.");
		}
		
		m.addAttribute("user", vo);
		
		return "member/myinfoeditform";
	}
	
	
	@PostMapping("/edit")
	public String editEnd(Model m, @ModelAttribute("user") UserVO user) {
		log.info("edit==="+user);
		if(user.getName()==null||user.getUserid()==null||user.getPwd()==null||
				user.getName().trim().isEmpty()||user.getUserid().trim().isEmpty()||user.getPwd().trim().isEmpty()) {
			return "redirect:join";
		}
		
		int n=aService.updateUser(user);
		String str=(n>0)?"회원 정보 수정 성공":"회원 정보 수정 실패";
		String loc=(n>0)?"../admin/userList":"javascript:history.back()";
		
		m.addAttribute("message", str);
		m.addAttribute("loc", loc);
		return "msg";
	}
	@GetMapping("/ditchList")
	public String ditchList(Model m) {
		
		List<DitchVO> list=mService.ditchProdAllList();
		m.addAttribute("ditchList",list);
		return "/admin/ditchList";
	}
	@GetMapping(value="ditchDel/{dnum}")
	public String ditchDel(Model m,@PathVariable(name = "dnum") int dnum){
		int n=mService.deleteDitch(dnum);
		if(n>0) {
			return common.addMsgLoc(m, "폐가구 수거삭제 완료", "/admin/ditchList");
		}
		return common.addMsgBack(m,"폐가구 수거삭제 실패");
		
	}
	
	
	
	//******관리자 게시판 시작-------------------------------------------------------------->
	//글 작성/편집/답글 컨트롤러
	
	@GetMapping("/write")
	public String boardWrite() {
		return "adminBoard/boardWrite";
	}
	
	
	
	@PostMapping("/write")
	public String broadInsert(HttpServletRequest req, HttpSession session,
			Model m, @RequestParam("mfilename") MultipartFile mfilename, 
			@ModelAttribute BoardVO board) {
		ServletContext app=req.getServletContext();
		String upDir=app.getRealPath("/resources/board_upload");
		File dir=new File(upDir);//저장경로
		log.info(upDir+"-----------------sss---------");
		if(!dir.exists()) {
			dir.mkdirs();//업로드 디렉토리의 경로가 없는 경우 전체를 다 만들어줌
		}
		
		if(!mfilename.isEmpty()) {
			String originFname=mfilename.getOriginalFilename();//mfilename에서 원본 파일 이름 추출하기
			long fsize=mfilename.getSize();//파일 사이즈
			
			UUID uuid=UUID.randomUUID();//파일 중복저장을 막기위한 랜덤값 설정
			String filename=uuid.toString()+"_"+originFname;//실제 업로드 시킬파일	
			
			if(board.getMode().equals("edit")&& board.getOld_filename()!=null) {
				//수정 모드라면 예전에 업로드했던 파일은 삭제 처리
				File delF=new File(upDir, board.getOld_filename());
				if(delF.exists()) {
					boolean b=delF.delete();
					log.info("old file삭제여부: "+b);
				}
			}
				
			try {
				mfilename.transferTo(new File(upDir,filename));//해당절대경로에 실제 업로드함
			} catch (Exception e) {
				e.printStackTrace();
			}
			log.info(upDir);
			board.setFilename(filename);//실제 저장된 파일이름(랜덤값+원본파일 이름)
			board.setOriginFilename(originFname);//원본 파일이름
			board.setFilesize(fsize);//파일 사이즈
		}
		
		
		//제목 입력하지 않을 시 다시 입력창 보여주기
		if(board.getSubject()==null||board.getSubject().trim().isEmpty()) {
			if("rewrite".equals(board.getMode())){
				return "redirect:rewrite";
			}else if("write".equals(board.getMode())) {
				return "redirect:write";
			}	
		}

		int n=0;
		String str="",loc="";
		if("write".equals(board.getMode())) {
			n=this.bService.insertBoard(board)+this.bService.updateAdminSunbun(board)-1;//글작성 성공:1 <-> 실패시:0 or -1	
			str+="글쓰기 ";
		}else if("edit".equals(board.getMode())) {
			n=this.bService.updateBoard(board);//해당 글 수정
			str+="글수정 ";
		}else if("rewrite".equals(board.getMode())) {
			//답변은 관리자만 접근할 수 있으며 boardView.jsp에서 관리자만 접근할 버튼 만듬. 이에 관리자 확인 조건을 붙이지 않았음
			n=this.bService.rewriteBoard(board);
			str+="답변 ";
		}
		str+=(n>0)?"성공":"실패";
		loc=(n>0)?"list":"javascript:history.back()";
		
		return util.addMsgLoc(m, str, loc);
	}//--------------------------------------
	
	//글삭제 기능
	@PostMapping("/delete")
	public String adminBoardDelete(Model m, 
			HttpServletRequest req,
			@RequestParam(defaultValue = "0") int num) {
		
		BoardVO vo=this.bService.selectBoardByIdx(num);
		if(vo==null) {
			return util.addMsgBack(m, "해당글은 존재하지 않습니다");
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
	
	
	//관리자 답글 기능: jsp로 이동 
	@PostMapping("/rewrite")
	public String boardRewrite(Model m, @ModelAttribute BoardVO vo) {
		m.addAttribute("num",vo.getNum());
		m.addAttribute("subject",vo.getSubject());
		m.addAttribute("bcg_code",vo.getBcg_code());
		m.addAttribute("secret",vo.getSecret());
		
		return "adminBoard/boardRewrite2";
	}
	
	//글 뷰페이지
	@GetMapping("/view/{num}")
	public String boardView(@PathVariable("num") int num, Model m,HttpSession session) {
		this.bService.updateReadnum(num);
		BoardVO board=this.bService.selectBoardByIdx(num);//글번호를 통해 해당 게시글 정보 호출
	
		m.addAttribute("board",board);

		return "adminBoard/boardView";		
	}

	//글목록 컨트롤러
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
		page.init(ses);//기본 페이지 값 설정
		
		log.info("2. page==="+page);
		List<BoardVO> boardArr=this.bService.selectBoardAllPaging(page);//글 목록 호출
		String loc="board/list";
		String pageNavi=page.getPageNavi(myctx, loc, userAgent);//페이징 블럭 처리 함수
		
		m.addAttribute("pageNavi",pageNavi);
		m.addAttribute("boardArr",boardArr);
		m.addAttribute("paging",page);
		
		return "adminBoard/boardList";	
	
	}
	
	
	//글 수정하는 jsp로 이동
	@PostMapping("/boardEdit")
	public String boardEditForm(Model m, 
			@RequestParam(defaultValue = "0") int num) {
		
		BoardVO vo=this.bService.selectBoardByIdx(num);
		if(vo==null) {
			return util.addMsgBack(m, "해당 글이 존재하지 않습니다.");
		}
	
		m.addAttribute("board", vo);
		
		return "adminBoard/boardEdit";
	}
	//******관리자 게시판 끝-------------------------------------------------------------->
}