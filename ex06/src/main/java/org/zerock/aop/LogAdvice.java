package org.zerock.aop;

import java.lang.reflect.Array;
import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect //공통관심사 선언
@Log4j
@Component //bean등록
public class LogAdvice {
	@Before("execution(* org.zerock.service.SampleService*.*(..))") //excution 접근제한자, 클래스의 이름과 메서드이름
	public void logBefore() {
		log.info("===========================================");
	}
	
	@Before("execution(* org.zerock.service.SampleService*.doAdd(String,String)) && args(str1, str2)")
	public void logBeforeWithParam(String str1, String str2) {
		log.info("str1 : " + str1);
		log.info("str2 : " + str2);
	}
	
	@Around("execution(* org.zerock.service.SampleService*.*(..))") //Around : 직접 대상메소드 실행, 메서드 실행 전 후 처리 가능
	public Object logTime(ProceedingJoinPoint pjp) {
		long start = System.currentTimeMillis();
		
		log.info("Target:" + pjp.getTarget());
		log.info("Param:" + Arrays.toString(pjp.getArgs()));
		
		Object result= null;
		try {
			result=pjp.proceed();
		}catch(Throwable e) {
			e.printStackTrace();
		}
		long end = System.currentTimeMillis();
		log.info("Time:" + (end-start));
		return result;
	}
	
}
