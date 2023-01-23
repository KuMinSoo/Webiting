package com.multi.webiting;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.admin.model.CountVO;
import com.admin.model.MonthVO;
import com.admin.model.SalesVO;
import com.admin.model.UserCountVO;
import com.admin.service.StatsService;

import lombok.extern.log4j.Log4j;

@RestController //데이터가 오갈때만 쓰는 컨트롤러 view단을 보여주려면 다른 컨트롤러에서 처리하기
@RequestMapping("/admin")
@Log4j
public class StatsController {
	
	@Autowired
	@Qualifier("statsServiceImpl")
	private StatsService sService;
	
	@GetMapping(value="/statsVO", produces="application/json")
	@ResponseBody
	public List<CountVO> statsVO() {
		List<CountVO> cvo=new ArrayList<>();
		cvo=sService.getOrdered();
		
		return cvo;
	}
	
	@GetMapping(value = "/userVO", produces = "application/json")
	@ResponseBody
	public List<UserCountVO> userVO(){
		List<UserCountVO> cvo=new ArrayList<>();
		cvo=sService.getUser();
		
		return cvo;
	}
	
	@GetMapping(value = "/ageVO", produces = "application/json")
	@ResponseBody
	public List<UserCountVO> ageVO(){
		List<UserCountVO> cvo=new ArrayList<>();
		cvo=sService.getAge();
		
		return cvo;
	}
	
	@GetMapping(value = "/salesVO", produces = "application/json")
	@ResponseBody
	public List<SalesVO> salesVO(){
		List<SalesVO> svo=new ArrayList<>();
		svo=sService.getSales();
		
		return svo;
	}
	@GetMapping(value = "/monthVO", produces = "application/json")
	@ResponseBody
	public List<MonthVO> monthVO(){
		List<MonthVO> svo=new ArrayList<>();
		svo=sService.getMonthSales();
		for(int i=0;i<svo.size();i++) {
			log.info(svo.get(i).getOrdered_date()+"/"+svo.get(i).getTotalprice());
		}
		return svo;
	}
	
}
