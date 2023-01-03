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
   
   
   @GetMapping("/home")//고객문의 메인 게시판
   public String boardHome() {
      return "board/boardHome";
   }
   
   @GetMapping("/write")
   public String boardWrite() {
      return "board/boardWrite";
   }
   //글 작성/편집/답글 컨트롤러
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
      
      
      //제목, 작성자, 비밀번호 입력하지 않을 시 다시 입력창 보여주기
      if(board.getName()==null||board.getSubject()==null||board.getPasswd()==null||
         board.getName().trim().isEmpty()||board.getSubject().trim().isEmpty()||board.getPasswd().isEmpty()) {
         return "redirect:rewrite";
      }   
      log.info("before====================="+board);
      UserVO loginUser=loginCheck(session);//세션에서 로그인 정보를 가져온다-> 차후 로그인 정보를 비교하여 게시글 접근 범위를 설정하기 필요함
      int n=0;
      String str="",loc="";
      if("write".equals(board.getMode())) {
         n=this.bService.insertBoard(board);//글작성   
         str+="글쓰기 ";
      }else if("edit".equals(board.getMode())) {
         n=this.bService.updateBoard(board);//해당 글 수정
         str+="글수정 ";
         log.info("before====================="+board);
      }else if("rewrite".equals(board.getMode())) {
         //답변은 관리자만 접근할 수 있으며 boardView.jsp에서 관리자만 접근할 버튼 만듬. 이에 관리자 확인 조건을 붙이지 않았음
         n=this.bService.rewriteBoard(board);
         str+="답변 ";
      }
      
      str+=(n>0)?"성공":"실패";
      loc=(n>0)?"list":"javascript:history.back()";
            
      m.addAttribute("loginUser",loginUser);
      
      return util.addMsgLoc(m, str, loc);
   }//--------------------------------------
   
   //세션에서 로그인 정보를 가져온다.
   public static UserVO loginCheck(HttpSession session) {
      UserVO loginUser=(UserVO)session.getAttribute("loginUser");
      return loginUser;
   }
   
   //비밀번호 체크 후 글 수정하는 jsp로 이동
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
      
      UserVO loginUser=loginCheck(session);
      m.addAttribute("loginUser",loginUser);
      m.addAttribute("pageNavi",pageNavi);
      m.addAttribute("boardArr",boardArr);
      m.addAttribute("paging",page);
      
      return "board/boardList";

   }//--------------------

   //게시판 뷰페이지 컨트롤러
   @GetMapping("/view/{num}")
   public String boardView(@PathVariable("num") int num, Model m,HttpSession session) {
      this.bService.updateReadnum(num);
      BoardVO board=this.bService.selectBoardByIdx(num);//글번호를 통해 해당 게시글 정보 호출
   
      UserVO loginUser=loginCheck(session);
      m.addAttribute("loginUser",loginUser);
      m.addAttribute("board",board);
      log.info("==============111"+board);
      return "board/boardView";      
   }
   
   //비밀글 확인 컨트롤러(비밀글 비밀번호 일치 여부 판단 후 해당 jsp로 이동함)
   @PostMapping("/pwdCheck")
   public String pwdCheck(@RequestParam(defaultValue = "") String passwd,int num,Model m) {
      System.out.println(passwd+"<<<<1");
      BoardVO board=this.bService.selectBoardByIdx(num);//해당 글정보 호출   
      System.out.println(board.getPasswd()+"<<<<2");
      
      if(board.getPasswd().equals(passwd)) {         
         return "redirect:/board/view/"+num; //비밀번호 일치
      }else{
      return util.addMsgBack(m,"비밀번호가 일치하지 않습니다");   //비밀번호 불일치
      }
   }
   
   
   //회원 삭제 기능(비밀번호 일치여부 판단 후 삭제함)
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