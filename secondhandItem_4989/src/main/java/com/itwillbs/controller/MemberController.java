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
	
	//로그인 처리기능
	@PostMapping("/loginPro")
	public String loginPro(MemberDTO memberDTO,HttpSession session) {
		
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
		System.out.println(memberDTO2);
		if(memberDTO2 != null) {
			
			session.setAttribute("member_id", memberDTO2.getMember_id());
			
			return "redirect:/";
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
	
	//회원가입 처리기능
	@PostMapping("/joinPro")
	public String insertPro(MemberDTO memberDTO) {
		System.out.println("MemberController joinPro");
		System.out.println(memberDTO);
		
		memberService.insertMember(memberDTO);
		
		// 로그인 주소변경 이동
		return "redirect:/member/welcome";
	}
	
	//로그아웃 처리기능(세션값 제거)
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("MemberController logout");
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/naver")
	public String naver() {
		return "/member/naverlogin";
	}
	
	@GetMapping("/call")
	public String call() {
		return "/member/callback";
	}
	
	@GetMapping("/result")
	public String result() {
		return "/member/result";
	}
	
	@GetMapping("/result1")
	public String result1() {
		
		return "/member/result1";
	}
	
}
