package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	@GetMapping("/login")
	public String login() {
		return "/member/login";
	}
	
	@GetMapping("/join")
	public String join() {
		return "/member/join";
	}
	
	@GetMapping("/social")
	public String social() {
		return "/member/social";
	}
	
	@PostMapping("/loginPro")
	public String loginPro(MemberDTO memberDTO,HttpSession session) {
		System.out.println("MemberController loginPro");
		System.out.println(memberDTO);
		
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
		if(memberDTO2 != null) {
			
			session.setAttribute("member_id", memberDTO.getMember_id());
			
			return "redirect:/member/welcome";
		}else {
			
			return "redirect:/member/login";
		}
	}
	
	@GetMapping("/welcome")
	public String welcome() {
		return "/member/welcome";
	}
	
	@GetMapping("/findid")
	public String findid() {
		return "/member/findid";
	}
	
	@GetMapping("/findpass")
	public String findpass() {
		return "/member/findpass";
	}
	
	@PostMapping("/joinPro")
	public String insertPro(MemberDTO memberDTO) {
		System.out.println("MemberController joinPro");
		System.out.println(memberDTO);
		
		memberService.insertMember(memberDTO);
		
		// 로그인 주소변경 이동
		return "redirect:/member/login";
	}
	
}
