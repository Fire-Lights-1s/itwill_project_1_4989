package com.itwillbs.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;
import java.time.temporal.ChronoUnit;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.ZzimDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MyPageService;

@Controller
@RequestMapping("/my/*")
public class MyPageController {
	
	@Inject
	private MyPageService myPageService;
	
	@Inject
	private MemberService memberService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@GetMapping("/profile")
	public String profile(HttpSession session, Model model) {
		System.out.println("MyPageController profile()");
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		memberDTO.setAllTX(myPageService.allTX(id)); 
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
	public String infoUpdatePro(HttpServletRequest request, MultipartFile file)throws Exception {
		System.out.println("MyPageController infoUpdatePro()");
		UUID uuid = UUID.randomUUID();
		String filename = uuid.toString() + "_" + file.getOriginalFilename();
		FileCopyUtils.copy(file.getBytes(), new File(uploadPath, filename));
		String member_id = request.getParameter("member_id");
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String nickname = request.getParameter("nickname");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_id(member_id);
		memberDTO.setName(name);
		memberDTO.setPass(pass);
		memberDTO.setNickname(nickname);
		memberDTO.setPhone(phone);
		memberDTO.setEmail(email);
		memberDTO.setProfile_img(filename);
		memberService.updateMember(memberDTO);
		return "redirect:/my/profile";
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
	public String buy(HttpSession session, Model model, HttpServletRequest request) {
		System.out.println("MyPageController buy()");
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
		List<ProductDTO> productList = myPageService.getBuyList(pageDTO);
		int count = myPageService.getBuyCount(pageDTO);
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
		return "my/buy";
	}
	
	@GetMapping("/zzim")
	public String zzim(HttpSession session, Model model, HttpServletRequest request) {
		System.out.println("MyPageController zzim()");
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		String pageNum = request.getParameter("pageNum");
		String sort = request.getParameter("sort");
		String product_id = request.getParameter("nozzim");
		ZzimDTO zzimDTO = new ZzimDTO();
		if(pageNum == null) {
			pageNum = "1";
		}
		if(product_id != null) {
			 zzimDTO.setProduct_id(Integer.parseInt(product_id));
			 zzimDTO.setMember_id(id);
			 myPageService.deleteZzim(zzimDTO);
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 8;
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		pageDTO.setSeller_id(id);
		pageDTO.setSort(sort);
		List<ProductDTO> productList = myPageService.getZzimList(pageDTO);
		int count = myPageService.getZzimCount(pageDTO);
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
		return "my/zzim";
	}
	
	@PostMapping("/deleteMem")
	public String deleteMem(HttpSession session) {
		System.out.println("MyPageController deleteMem()");
		String member_id = (String)session.getAttribute("member_id");
		myPageService.deleteMem(member_id);
		return "redirect:/";
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