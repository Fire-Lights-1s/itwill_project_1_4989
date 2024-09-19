package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.NoticeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PurchaseRequestDTO;
import com.itwillbs.service.PurchaseService;

@Controller
@RequestMapping("/my")
public class MyPurchaseController {

	@Inject
	private PurchaseService purchaseService;
	
	@GetMapping("/purchlist")
	public String getPurchList(HttpSession session, HttpServletRequest request, Model model) {
		String member_id = (String) session.getAttribute("member_id");
		if (member_id == null || member_id.isEmpty()) {
			return "redirect:/member/login";
		}
		
		PageDTO pageDTO = new PageDTO();
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10;
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		
		List<PurchaseRequestDTO> list = purchaseService.getPurchList(pageDTO, member_id);
		int count = purchaseService.getPurchCount(member_id);
		
		int pageBlock = 10;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if(startPage < 1) {
			startPage = 1;
		}
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("list", list);
		return "my/purch/list";
	}
	
	@GetMapping("/purchdetail")
	public String getPurchDetail(@RequestParam int purchase_id, Model model) {
		PurchaseRequestDTO detail = purchaseService.getPurchDetail(purchase_id);
		model.addAttribute("detail", detail);
		return "my/purch/detail";
	}
	
	@GetMapping("/cancel")
	public String cancelRequest(@RequestParam int purchase_id) {
		purchaseService.cancelRequest(purchase_id);		
		return "redirect:purchlist";
	}
	
}
