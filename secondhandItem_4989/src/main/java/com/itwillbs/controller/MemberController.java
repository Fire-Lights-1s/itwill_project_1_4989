package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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
			session.setAttribute("nickname", memberDTO2.getNickname());
			
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
	
	@GetMapping("/asd")
	public String asd() {
		return "/member/asd";
	}
	
	
	@GetMapping("/callPro")
	public String callPro(MemberDTO memberDTO,HttpSession session) {
		
		String email = (String) session.getAttribute("email");
		
		memberDTO = new MemberDTO();
	    memberDTO.setEmail(email);
		
		MemberDTO memberDTO3 = memberService.SocialCheck(memberDTO);
		
		
		
		if(memberDTO3 != null) {
			session.setAttribute("member_id", memberDTO3.getMember_id());
			session.setAttribute("nickname", memberDTO3.getNickname());
			return "redirect:/";
		} else {
			System.out.println("memberDTO3 is null");
			return "redirect:/member/social";
		}
		
	}
	
	
	
	@PostMapping("/socialPro")
	public String socialPro(MemberDTO memberDTO, HttpSession session, HttpServletRequest request) {
		System.out.println("MemberController socialPro");
		System.out.println(memberDTO);
		session = request.getSession();
        String member_id = (String) session.getAttribute("member_id");
        String name = (String) session.getAttribute("name");
        String email = (String) session.getAttribute("email");

        // MemberDTO 객체 생성
        
        memberDTO.setMember_id(member_id);
        memberDTO.setName(name);
        memberDTO.setEmail(email);
		
		
		memberService.insertSocial(memberDTO);
		System.out.println(memberDTO);
		
		session.setAttribute("member_id", memberDTO.getMember_id());
		session.setAttribute("nickname", memberDTO.getNickname());
		
		// 로그인 주소변경 이동
		return "redirect:/";
	}
	
	@GetMapping("/resultid")
	public String resultid() {
		return "/member/resultid";
	}
	
	@PostMapping("/findidPro")
	public String findidPro(MemberDTO memberDTO,HttpSession session) {
		
		MemberDTO memberDTO2 = memberService.idCheck(memberDTO);
		System.out.println(memberDTO2);
	
		
		 if (memberDTO2 != null) {
			        
			        session.setAttribute("member_id", memberDTO2.getMember_id());
			        System.out.println(session.getAttribute("member_id"));
			        
			        return "redirect:/member/resultid"; // 반드시 반환
			    } else {
			        return "redirect:/member/findid"; // 반드시 반환
			    }
	}
	
	@GetMapping("/resultpass")
	public String resultpass() {
		return "/member/resultpass";
	}
	
	@PostMapping("/findpassPro")
	public String findpassPro(MemberDTO memberDTO,HttpSession session) {
		
		MemberDTO memberDTO2 = memberService.passCheck(memberDTO);
		System.out.println(memberDTO2);
	
		
		 if (memberDTO2 != null) {
			        
			        session.setAttribute("pass", memberDTO2.getPass());
			        System.out.println(session.getAttribute("pass"));
			        
			        return "redirect:/member/resultpass"; // 반드시 반환
			    } else {
			        return "redirect:/member/findpass"; // 반드시 반환
			    }
	}
	
}
