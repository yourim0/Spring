package org.zerock.controller;

import java.util.ArrayList;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.SampleDTO;
import org.zerock.domain.SampleDTOList;
import org.zerock.domain.TodoDTO;

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
	
	@GetMapping("ex02")
	public String ex02(@RequestParam("name") String name, @RequestParam("age") int age) { //request.getparameter와 같음
		
		log.info(name);
		log.info(age);
		
		return "ex02";
	}
	
	@GetMapping("ex02List")
	public String ex02List(@RequestParam("ids") ArrayList<String> ids) {
		
		log.info("ids : " + ids);

		return "ex02List";
	}
	
	@GetMapping("ex02Bean")
	public String ex02Bean(SampleDTOList list) {
		
		log.info("list : " + list);
		
		return "ex02Bean";
	}
	
	
	@GetMapping("ex03")
	public String ex03(TodoDTO todo) { //커맨드 객체
		log.info("Todo : " + todo);
		
		return "ex03";
	}
	
	@GetMapping("ex04")
	public String ex04(SampleDTO dto, @ModelAttribute("page")int page) { //int page는 페이지 이동시 넘어가지 않는다. 
		//커맨드 객체
		//1.파라미터 자동으로 받기
		//2. 뷰페이지로 커맨드 객체의 정보를 전달한다(클래스의 첫글자를 소문자로 구성해서 전달)
		// sampleDTO 
		//3. 기본형 매개변수에 대해 뷰페이지로 값 전달을 위해 @ModelAttribute를 적용한다
		// Model객체에 담겨서 전달 된다. 
		
		log.info("dto : " + dto);
		log.info("page : " + page);
		
		return "/sample/ex04";
	}
	
	//json 형태
	@GetMapping("ex06")
	public @ResponseBody SampleDTO ex06() { //json 형태의 데이터를 body영역에 담아서 넘어간다
		 SampleDTO dto = new SampleDTO();
		 dto.setAge(10);
		 dto.setName("limi");
		 
		return dto;
	}
	
	@GetMapping("ex07")
	public ResponseEntity<String> ex07() { //json 형태의 데이터를 body영역에 담아서 넘어간다

		String msg = "{\"name\":\"홍길동\"}"; //{"name":"홍길동"} 속성과 값이 문자열로 이루어진 값을 보내겠다
		HttpHeaders header = new HttpHeaders(); //헤더영역의 정보를 가져옴
		header.add("Content-type","application/json;charset=UTF-8");
		
		return new ResponseEntity<>(msg,header,HttpStatus.OK);
	}
	
	@GetMapping("/exUpload")
	public void exUpload() {
		log.info("/exUpload.....");
	}
	
	@PostMapping("/exUploadPost")
	public void exUploadPost(ArrayList<MultipartFile> files) {
		files.forEach(file->{
			log.info("====");
			log.info("name"+file.getOriginalFilename());
			log.info("size"+file.getSize());
		});
	}
	
}
