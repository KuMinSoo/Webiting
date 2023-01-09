package com.common;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.extern.log4j.Log4j;


@ControllerAdvice
@Log4j
public class CommonExceptionAdvice {
	
	@ExceptionHandler(NumberFormatException.class)
	public String cmmNumberException(Exception e) {
		log.error(e);
		return "/login/errorAlert";
	}
	
}
