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
import com.itwillbs.domain.ReportDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MyPageService;
import com.itwillbs.service.ProductService;

@Controller
@RequestMapping("/your/*")
public class YourPageController {
	
	@Inject
	private MyPageService myPageService;
	@Inject
	private MemberService memberService;
	@Inject
	private ProductService productService;
	
	@GetMapping("/seller")
	public String seller(HttpSession session, HttpServletRequest request, Model model) {
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		String otherUser = request.getParameter("otherUser");
		MemberDTO otherUserDTO = memberService.getMember(otherUser);
		otherUserDTO.setAllTX(myPageService.allTX(otherUser));
		model.addAttribute("otherUserDTO", otherUserDTO);
		return "your/seller";
	}
	
	@GetMapping("/sellerHistory")
	public String seller(HttpSession session, Model model, HttpServletRequest request) {
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		String pageNum = request.getParameter("pageNum");
		String sort = request.getParameter("sort");
		String sale = request.getParameter("sale");
		String otherUser = request.getParameter("otherUser");
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 8;
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		pageDTO.setSeller_id(otherUser);
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
		model.addAttribute("otherUser", otherUser);
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("productList", productList);
		return "your/sellerHistory";
	}
	
	@PostMapping("/reportPro")
	public String reportPro(HttpServletRequest request, HttpSession session) {
		String reporterId = (String)session.getAttribute("member_id");
		String reporteeId = request.getParameter("otherUser");
		String reportContents = request.getParameter("report_contents");
		ReportDTO reportDTO = new ReportDTO();
		reportDTO.setReporter_id(reporterId);
		reportDTO.setReportee_id(reporteeId);
		reportDTO.setReport_type("회원");
		reportDTO.setReport_contents(reportContents);
		reportDTO.setReport_status("접수"); // 초기 상태는 '접수'
		productService.submitReport(reportDTO);
		return "redirect:/your/seller?otherUser=" + reporteeId;
	}
	
	
}