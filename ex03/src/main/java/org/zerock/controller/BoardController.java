package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {	
	
	private BoardService service;
	
//	@GetMapping("/list")
//	public void list(Model model) {
//		log.info("list");
//		model.addAttribute("list",service.getList());
//	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) { //criterai를 커맨드 객체로 받음 커멘드 객체는 스프링 컨테이너가 생성해준다
		log.info("list" + cri);
		model.addAttribute("list", service.getList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri,123));
		
		int total = service.getTotal(cri);
		log.info("total"+total);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register : " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno()); //일회성이라 리프레시할 경우 데이터가 소멸
		
		return "redirect:/board/list";
	}
	
//	@GetMapping({"/get", "/modify"})
//	public void get(@RequestParam("bno") Long bno, Model model) {
//		log.info("/get or /modify");
//		model.addAttribute("board", service.get(bno));
//	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) { //model에 cri객체도 같이 담겨 전달된다 modelattribute 사용안하면  Criteria 클래스명 소문자 첫글자만 바뀌어서 넘어간다
		log.info("/get or /modify");
		model.addAttribute("board", service.get(bno));
	}
	
	//@PostMapping("/modify")
	//public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
	//	log.info("modify : " + board );
		
	//	if(service.modify(board)) { //1
	//		rttr.addFlashAttribute("result", "success");
	//	}
		
		// 수정 후 사용자가 있던 페이지로 이동하기 위함
	//	rttr.addAttribute("pageNum",cri.getPageNum());
	//	rttr.addAttribute("amount", cri.getAmount());
	//	rttr.addAttribute("type", cri.getType());
	//	rttr.addAttribute("keyword", cri.getKeyword());
		
	//	return "redirect:/board/list";
	//}

		//getListLink() 이용
		@PostMapping("/modify")
		public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) {
			log.info("modify" + board);
			if(service.modify(board)) {
				rttr.addFlashAttribute("result","success");
			}
			return "redirect:/board/list" + cri.getListLink();
			}
		
		

		//@PostMapping("/remove")
		//public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		//	log.info("remove.." + bno);
		//	if(service.remove(bno)) {
		//		rttr.addFlashAttribute("result","success");
		//	}
		
		// 삭제 후 사용자가 있던 페이지로 이동하기 위함
		//rttr.addAttribute("pageNum",cri.getPageNum());
		//rttr.addAttribute("amount", cri.getAmount());
		//rttr.addAttribute("type", cri.getType());
		//rttr.addAttribute("keyword", cri.getKeyword());
		
		//return "redirect:/board/list"; //Get방식
	//}
		
		@PostMapping("/remove")
		public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
			log.info("remove..." + bno);
			if(service.remove(bno)) {
				rttr.addFlashAttribute("result","success");
			}
			return "redirect:/board/list" + cri.getListLink();
		}
		
	}
