package com.multi.webiting;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.admin.model.CountVO;
import com.admin.model.MonthVO;
import com.admin.model.MonthVO2;
import com.admin.model.SalesVO;
import com.admin.model.UserCountVO;
import com.admin.service.StatsService;
import com.user.model.UserVO;

import lombok.extern.log4j.Log4j;

@RestController //데이터가 오갈때만 쓰는 컨트롤러 view단을 보여주려면 다른 컨트롤러에서 처리하기
@Log4j
public class StatsController {
	
	@Autowired
	@Qualifier("statsServiceImpl")
	private StatsService sService;
	
	@GetMapping(value="/admin/statsVO", produces="application/json")
	@ResponseBody
	public List<CountVO> statsVO() {
		List<CountVO> cvo=new ArrayList<>();
		cvo=sService.getOrdered();
		
		return cvo;
	}
	
	@GetMapping(value = "/admin/userVO", produces = "application/json")
	@ResponseBody
	public List<UserCountVO> userVO(){
		List<UserCountVO> cvo=new ArrayList<>();
		cvo=sService.getUser();
		
		return cvo;
	}
	
	@GetMapping(value = "/admin/ageVO", produces = "application/json")
	@ResponseBody
	public List<UserCountVO> ageVO(){
		List<UserCountVO> cvo=new ArrayList<>();
		cvo=sService.getAge();
		
		return cvo;
	}
	
	@GetMapping(value = "/admin/salesVO", produces = "application/json")
	@ResponseBody
	public List<SalesVO> salesVO(){
		List<SalesVO> svo=new ArrayList<>();
		svo=sService.getSales();
		
		return svo;
	}
	@GetMapping(value = "/admin/monthVO", produces = "application/json")
	@ResponseBody
	public List<MonthVO> monthVO(){
		List<MonthVO> svo=new ArrayList<>();
		svo=sService.getMonthSales();
		/*
		 * for(int i=0;i<svo.size();i++) {
		 * log.info("svo: "+svo.get(i).getOrdered_date()+"/"+svo.get(i).getTotalprice())
		 * ; }
		 */
		return svo;
	}
	
	@GetMapping(value = "/admin/monthVO2", produces = "application/json")
	@ResponseBody
	public List<MonthVO> MonthVO2(@RequestParam("year") String year){
		log.info("year: "+year);
		List<MonthVO> svo=new ArrayList<>();
		svo=sService.getMonthSalesByYear(Integer.parseInt(year));
		/*
		 * for(int i=0;i<svo.size();i++) {
		 * log.info(svo.get(i).getOrdered_date()+"/"+svo.get(i).getTotalprice()); }
		 */
		return svo;
	}
	
	@GetMapping(value="/mypage/userStatsVO")
	public List<MonthVO> userStatsVO(@RequestParam("year") String year, HttpSession session){
		
		UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
		int idx=loginUser.getIdx();
		
		MonthVO2 mvo2=new MonthVO2();
		mvo2.setIdx(idx);
		mvo2.setYear(Integer.parseInt(year));
		
		List<MonthVO> svo=new ArrayList<>();
		svo=sService.getUserStats(mvo2);
		for(int i=0;i<svo.size();i++) {
			log.info(svo.get(i).getOrdered_date()+"/"+svo.get(i).getTotalprice());
		}
		return svo;
	}
}
