package com.product.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


public class DateVO {
	
	String today;
	String day;
	String week;
	String month;
	String year;
	
	
	public Map<String, String> CalDate() {
			
			Calendar cal=Calendar.getInstance();
			Calendar cal1=Calendar.getInstance();
			Calendar cal2=Calendar.getInstance();
			Calendar cal3=Calendar.getInstance();
		
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		
			cal.add(Calendar.DATE, -1);
			cal1.add(Calendar.DAY_OF_WEEK_IN_MONTH, -1);	
			cal2.add(Calendar.MONTH, -1);
			cal3.add(Calendar.YEAR,-1);
			today=df.format(new Date());
			day=df.format(cal.getTime());
			week=df.format(cal1.getTime());
			month=df.format(cal2.getTime());
			year=df.format(cal3.getTime());
			
			Map<String,String> map=new HashMap<>();
			map.put("today", today);
			map.put("day", day);
			map.put("week", week);
			map.put("month", month);
			map.put("year", year);
			
			return map;
			
		}

	
	public String getToday() {
		return today;
	}


	public void setToday(String today) {
		this.today = CalDate().get("today") ;
	}

	public String getDay() {
		return day;
	}


	public void setDay(String day) {
		this.day = CalDate().get("day") ;
	}


	public String getWeek() {
		return week;
	}


	public void setWeek(String week) {
		this.week = CalDate().get("week");
	}


	public String getMonth() {
		return month;
	}


	public void setMonth(String month) {
		this.month = CalDate().get("month");
	}


	public String getYear() {
		return year;
	}


	public void setYear(String year) {
		this.year = CalDate().get("year");;
	}


	@Override
	public String toString() {
		return "DateVO [today=" + today + ", day=" + day + ", week=" + week + ", month=" + month + ", year=" + year
				+ "]";
	}
	
	
	
}
