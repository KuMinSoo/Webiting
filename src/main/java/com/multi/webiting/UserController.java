package com.multi.webiting;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.CommonUtil;
import com.user.model.NotUserException;
import com.user.model.UserVO;

import com.user.service.KakaoService;
import com.user.service.UserService;


import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UserController {
	
	@Inject
	@Qualifier(value="UserServiceImpl")
	private UserService uService;
	
	@Inject
	private KakaoService kService;
	
	CommonUtil common = new CommonUtil();
	
	@GetMapping("/join")
	public String joinForm() {
		
		return "/join/join";
	}//---------------------------------------------------
	
	@PostMapping("/join")
	public String joinForm(Model m,@ModelAttribute("user") UserVO user ) {
		if(user.getUserid()==null||user.getName()==null||user.getPwd()==null||
			user.getUserid().trim().equals("")||user.getName().trim().equals("")||user.getPwd().trim().equals(""))
		{
			return common.addMsgBack(m,"정보를 다시 입력하세요");
		}
		int n=this.uService.createUser(user);
		if(n>0) {
			return common.addMsgLoc(m, "회원가입 성공", "/login");
		}else {
			return common.addMsgBack(m,"회원가입 실패");
		}
	}
	
	@GetMapping(value="/idcheck", produces="application/json")
	@ResponseBody
	public Map<String,String> idCheck(@RequestParam("userid") String userid){
		log.info("userid==="+userid);
		boolean isUse=uService.idCheck(userid);
		String result=(isUse)?"ok":"no";
		log.info("logisUse==="+result);
		Map<String,String>map=new HashMap<>();
		map.put("result", result);
		return map;
	}
	
	
//---login----------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------
	@GetMapping("/login")
	public String loginForm() {
		
		return "/login/login";
	}
	
	@PostMapping("/login")
	public String loginForm(Model m,@ModelAttribute("user") UserVO user,HttpSession ses) 
			throws NotUserException {
		log.info("userid=="+user.getUserid());
		log.info("userpwd=="+user.getPwd());
		UserVO vo=this.uService.loginCheck(user.getUserid(), user.getPwd());
		
		m.addAttribute("loginUser",vo);
		if(vo!=null) {
			ses.setAttribute("loginUser", vo);
			log.info("로그인 여부: true" );
			return common.addMsgLoc(m, "로그인 성공", "/index");
		}
		log.info("로그인 여부: false" );
		return common.addMsgBack(m, "로그인 실패");
	}
	@RequestMapping("/logout")
	@ResponseBody
	public String logout(HttpSession ses) {
		ses.invalidate();
		String reqUrl ="https://kauth.kakao.com/oauth/logout"
				+ "?client_id=d5db72c4c66d2bc59fcd57535bb579d1"
				+ "&logout_redirect_uri=http://localhost:9090/index";
		return reqUrl;
	}
	
	@RequestMapping(value = "/login/getKakaoAuthUrl")
	@ResponseBody
	public String getKakaoAuthUrl(
			HttpServletRequest request) throws Exception {
		
		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize"
				+"?client_id=d5db72c4c66d2bc59fcd57535bb579d1"//RestAPI�궎
				+"&redirect_uri=http://localhost:9090/login/oauth_kakao"
				+"&response_type=code";
		log.info(reqUrl);
		return reqUrl;
	}
	
	@RequestMapping(value ="/login/oauth_kakao")
	public String oauthKakao(@RequestParam(value = "code") String code,Model m,
			HttpServletRequest request, HttpSession ses)
			throws Exception {
		//String code = request.getParameter("code");
	    String error = request.getParameter("error");
	    if (error != null) {
	        if (error.equals("access_denied")) {
	            return "redirect:/login";
	        }
	    }

	    String accessToken = kService.getAccessToken(code);
	    String userInfo = kService.getUserInfo(accessToken);

        //JSON String -> JSON Object
	    JSONParser jsonParse = new JSONParser();
        JSONObject userInfoJsonObject =(JSONObject) jsonParse.parse(userInfo);

        //�쑀���쓽 Email 異붿텧
        JSONObject kakaoAccountJsonObject = (JSONObject)userInfoJsonObject.get("kakao_account");
        String kakaoEmail = kakaoAccountJsonObject.get("email").toString();
        log.info(kakaoEmail);
        
        
        if (kakaoEmail != null&&!kakaoEmail.trim().equals("")) {
        	UserVO vo=uService.emailCheck(kakaoEmail);
        	
        	if(vo==null) {
        		throw new NotUserException("등록된 회원이 없습니다..");
        	}
        	log.info(vo);
        	m.addAttribute("kakaoEmail", kakaoEmail);
        	m.addAttribute("loginUser", vo);
        	ses.setAttribute("loginUser", vo);
        	return common.addMsgLoc(m, "카카오 로그인 성공", "/index");
	    
	    } else {
	    	throw new NotUserException("등록된 회원이 없습니다.");
	    }
	}
}