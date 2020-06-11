package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	// 서비스 객체
	private BoardService service;

	// 게시물 목록 얻기
	@GetMapping("/list")
	public void list(Model model) { // 모델 객체가 자동으로 주입됨
		log.info("게시물 목록 얻기...");
		// service.getList(); return xxx; 결과가 view로 리턴. => 결과를 모델에 담아야 함
		// BoardServiceImpl 객체의 getList( ) 실행 후,
		// 그 결과인 게시물 목록을 모델에 담아서 전달함
		model.addAttribute("list", service.getList()); // 모델에 결과 담음
	}
	
	// 게시글 등록
	@GetMapping("/register")
	public void register() {
		//view: register.jsp
	} // 양식 return
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("게시글 등록.... " + board);
		service.register(board);
		
		// redirect할 곳에 결과를 전해줌
		rttr.addFlashAttribute("result", board.getBno());
		
		// 게시글 등록 후 목록 보여줌
		return "redirect:/board/list"; // 목록 페이지를 다시 요청하라고 요청함
	} //submit
	
	// 게시글 수정
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) { // board는 수정된 객체를 받는 것, 
		log.info("modify:" + board);
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success"); // 속성 result, 값 success로 
		}
		return "redirect:/board/list"; //redirect란 다시 보여달라
		// view name = redirect:/board/list
	}
	
	// 게시글 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		// 삭제할 bno 호출 
		log.info("remove..." + bno);
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success"); // 속성과 값을 전달
		}
		return "redirect:/board/list"; // 삭제된 이후 list를 보이기
	}
}
