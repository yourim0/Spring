package org.zerock.aop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect //공통관심사 선언
@Log4j
@Component //bean등록
public class LogAdvice {
	@Before("excution(* org.zerock.service.SampleService*.*(..))")
	public void logBefore() {
		log.info("===========================================");
	}
}
