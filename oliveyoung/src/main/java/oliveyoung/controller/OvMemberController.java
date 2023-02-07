package oliveyoung.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import oliveyoung.service.OvMemberService;
import oliveyoung.vo.OvMember;

@Controller
public class OvMemberController {
	// http://localhost:7080/oliveyoung/memberList.do
	@Autowired(required=false)
	public OvMemberService service;
	@RequestMapping("/memberList.do")
	public String memberList(@ModelAttribute("sch") OvMember sch, Model d) {
		d.addAttribute("mlist", service.memberList(sch));
		return "project_5\\project_oliveyoung\\oyMember";
	}
	@ModelAttribute("authCom")
	public List<String> getAuthComb(){
		return service.getAuthComb();
	}
	// http://localhost:7080/oliveyoung/main.do
	@RequestMapping("/main.do")
	public String main(){
		return "project_5\\project_oliveyoung\\oyMain";
	}
	@GetMapping("/joinFrm.do")
	public String joinFrm(){
		return "project_5\\project_oliveyoung\\oyJoin";
	}
	@PostMapping("/memberJoin.do")
	public String memberJoin(OvMember ins, Model d){
		service.memberJoin(ins);
	 	return "project_5\\project_oliveyoung\\oyMember";
	}
	
}
