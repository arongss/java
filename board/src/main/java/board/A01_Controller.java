package board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.vo.Board;
import board.vo.BoardSch;

@Controller
public class A01_Controller {
	// http://localhost:7080/board/list.do
	@Autowired(required=false)
	public A02_Service service;
	
	@RequestMapping("/list.do")
	public String boardList(@ModelAttribute("sch") BoardSch sch,Model d) {
		d.addAttribute("list", service.boardList(sch));
		return "a01_boardList";
	}
	@GetMapping("/insertFrm.do")
	public String insertFrm(){
		return "a02_insertBoard";
	}
	@PostMapping("/insert.do")
	public String insert(Board ins, Model d){
		service.insertBoard(ins);
		d.addAttribute("msg","등록성공");
		return "a02_insertBoard";
	}
	@GetMapping("board.do")
	public String getBoard(@RequestParam("no") int no, Model d) {
		service.uptReadCnt(no);
		d.addAttribute("board",service.getBoard(no));
		return "a03_board";
	}
}