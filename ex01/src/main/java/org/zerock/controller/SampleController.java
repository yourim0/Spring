package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.SampleDTO;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*") //sample 포함된 uri가 루트 밑으로 들어오면 얘가 동작
@Log4j
public class SampleController {
	@RequestMapping("")
	public void basic() {
		Log.info("basic!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
	}
	
	@GetMapping("ex01")
	public String ex01(SampleDTO dto) { //커맨드 객체
		
		log.info("" + dto);
		return "ex01";
	}
	
}
