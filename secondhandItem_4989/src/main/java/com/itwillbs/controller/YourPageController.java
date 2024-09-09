package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MyPageService;

@Controller
@RequestMapping("/your/*")
public class YourPageController {
	
	@Inject
	private MyPageService myPageService;
	
	@Inject
	private MemberService memberService;
	
	@GetMapping("/seller")
	public String seller(HttpSession session, Model model, HttpServletRequest request) {
		System.out.println("YourPageController seller()");
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		id = request.getParameter("otherUser");
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
		return "your/seller";
	}
	
	@GetMapping("/sellerHistory")
	public String seller() {
		System.out.println("YourPageController sellerHistory()");
		return "your/sellerHistory";
	}
	
	
}