package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MyPageService;

@Controller
@RequestMapping("/my/*")
public class MyPageController {
	
	@Inject
	private MyPageService myPageService;
	
	@Inject
	private MemberService memberService;
	
	@GetMapping("/profile")
	public String profile(HttpSession session, Model model) {
		System.out.println("MyPageController profile()");
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		model.addAttribute("memberDTO", memberDTO);
		return "my/profile";
	}
	
	@GetMapping("/infoCheck")
	public String infoCheck(HttpSession session) {
		System.out.println("MyPageController infoCheck()");
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		return "my/infoCheck";
	}
	
	@PostMapping("/infoCheckPro")
	public String infoCheckPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MyPageController infoCheckPro()");
		String id = (String)session.getAttribute("member_id");
		memberDTO.setMember_id(id);
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
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
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
	public String sell(HttpSession session, Model model, HttpServletRequest request) {
		System.out.println("MyPageController sell()");
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		String pageNum = request.getParameter("pageNum");
		String sort = request.getParameter("sort");
		String sale = request.getParameter("sale");
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 8;
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		pageDTO.setSeller_id(id);
		pageDTO.setSort(sort);
		pageDTO.setSale(sale);
		List<ProductDTO> productList = myPageService.getProductList(pageDTO);
		ProductDTO productDTO = new ProductDTO();
		productDTO.setSeller_id(id);
		int count = myPageService.getProductCount(pageDTO);
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("productList", productList);
		return "my/sell";
	}
	
	@GetMapping("/buy")
	public String buy(HttpSession session) {
		System.out.println("MyPageController buy()");
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		return "my/buy";
	}
	
	@GetMapping("/zzim")
	public String zzim(HttpSession session, Model model) {
		System.out.println("MyPageController zzim()");
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
//		List<ProductDTO> zzimList = myPageService.getProductList();
		return "my/zzim";
	}
	
	@GetMapping("/payPoint")
	public String payPoint(HttpSession session, Model model) {
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		model.addAttribute("memberDTO", memberDTO);
		
		return "/my/pay/point";
	}
	@GetMapping("/payAccount")
	public String payAccount(HttpSession session, Model model) {
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		model.addAttribute("memberDTO", memberDTO);
		
		return "/my/pay/account";
	}
	@GetMapping("/payCharge")
	public String payCharge(HttpSession session, Model model) {
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		model.addAttribute("memberDTO", memberDTO);
		
		return "/my/pay/charge";
	}
	@GetMapping("/paySend")
	public String paySend(HttpSession session, Model model) {
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		model.addAttribute("memberDTO", memberDTO);
		
		return "/my/pay/send";
	}
}