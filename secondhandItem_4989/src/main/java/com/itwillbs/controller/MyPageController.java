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
		System.out.println("1");
		if(pageNum == null) {
			pageNum = "1";
		}
		System.out.println("2");
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 8;
		System.out.println("3");
		PageDTO pageDTO = new PageDTO();
		System.out.println("4");
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		pageDTO.setSeller_id(id);
		pageDTO.setSort(sort);
		pageDTO.setSale(sale);
		System.out.println("5");
		List<ProductDTO> productList = myPageService.getProductList(pageDTO);
		System.out.println("6");
		ProductDTO productDTO = new ProductDTO();
		System.out.println("7");
		productDTO.setSeller_id(id);
		System.out.println(productDTO.getSeller_id());
		int count = myPageService.getProductCount(productDTO);
		System.out.println(count);	
		// 한 화면에 보여줄 페이지 개수
		int pageBlock = 5;
		System.out.println("10");
		// 시작하는 페이지 번호
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		System.out.println("11");
		// 끝나는 페이지 번호
		int endPage = startPage + pageBlock - 1;
		System.out.println("12");
		// 전체 글갯수 구하기
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		System.out.println("13");
		// endPage 전체 글갯수 비교 => endPage 크면 전체 글갯수 변경
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("14");
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		System.out.println(pageDTO);
		System.out.println(productDTO);
		System.out.println(productList);
		System.out.println(count);
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