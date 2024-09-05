package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MyPageService;

@Controller
@RequestMapping("/my/*")
public class MyPageController {
	
	@Inject
	private MemberService memberService;
	
	@GetMapping("/profile")
	public String profile(HttpSession session, Model model) {
		System.out.println("MyPageController profile()");
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		System.out.println(memberDTO);
		model.addAttribute("memberDTO", memberDTO);
		return "my/profile";
	}
	
	@GetMapping("/infoCheck")
	public String infoCheck() {
		System.out.println("MyPageController infoCheck()");
		return "my/infoCheck";
	}
	
	@PostMapping("/infoCheckPro")
	public String infoCheckPro(MemberDTO memberDTO) {
		System.out.println("MyPageController infoCheckPro()");
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
		System.out.println(memberDTO2);
		if(memberDTO2 != null) {
			return "redirect:/my/infoUpdate";
		}else {
			return "redirect:/my/infoCheck";
		}
	}
	
	@GetMapping("/infoUpdate")
	public String infoUpdate(HttpSession session, Model model) {
		System.out.println("MyPageController infoUpdate()");
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		System.out.println(memberDTO);
		model.addAttribute("memberDTO", memberDTO);
		return "my/infoUpdate";
	}
	
	@PostMapping("/infoUpdatePro")
	public String infoUpdatePro(MemberDTO memberDTO) {
		System.out.println("MyPageController infoUpdatePro()");
		memberService.updateMember(memberDTO);
		return "redirect:/";
	}
	
	@GetMapping("/sell")
	public String sell() {
		System.out.println("MyPageController sell()");
		return "my/sell";
	}
	
	@GetMapping("/buy")
	public String buy() {
		System.out.println("MyPageController buy()");
		return "my/buy";
	}
	
	@GetMapping("/zzim")
	public String zzim() {
		System.out.println("MyPageController zzim()");
		return "my/zzim";
	}
}