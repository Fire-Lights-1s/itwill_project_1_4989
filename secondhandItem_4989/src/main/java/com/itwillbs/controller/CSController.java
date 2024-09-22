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
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.FaqDTO;
import com.itwillbs.domain.InquiryDTO;
import com.itwillbs.domain.NoticeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.CSService;

@Controller
@RequestMapping("/cs")
public class CSController {

	@Inject
	private CSService csService;
	
	
	@GetMapping("/notice")
	public String noticeList(HttpServletRequest request, Model model) {
		
			PageDTO pageDTO = new PageDTO();
			String pageNum = request.getParameter("pageNum");
			String searchKey = request.getParameter("search");
			
			if(pageNum == null) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10;
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			pageDTO.setPageSize(pageSize);
			
			if(searchKey != null && !searchKey.isEmpty()) {
				pageDTO.setSearch(searchKey);
			}
			
			List<NoticeDTO> noticeList = csService.getNoticeList(pageDTO);
			int count = csService.getNoticeCount(pageDTO);
			
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
			model.addAttribute("noticeList", noticeList);
			
		return "/cs/notice";
	}
	
	@GetMapping("/noticedetail")
	public String noticeDetail(@RequestParam int notice_id, Model model) {
		NoticeDTO noticeDTO = csService.noticeDetail(notice_id);
		model.addAttribute("noticeDTO", noticeDTO);
		return "cs/notice_detail";
	}
	
	@GetMapping("/faq")
	public String faqList(HttpServletRequest request, Model model) {
		
		PageDTO pageDTO = new PageDTO();
		String pageNum = request.getParameter("pageNum");
		String searchKey = request.getParameter("search");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10;
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		
		if(searchKey != null && !searchKey.isEmpty()) {
			pageDTO.setSearch(searchKey);
		}
		
		List<FaqDTO> faqList = csService.getFaqList(pageDTO);
		int count = csService.getFaqCount(pageDTO);
		
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
		model.addAttribute("faqList", faqList);
		
		return "/cs/faq";
	}
	
	@GetMapping("/inquiry")
	public String inquiryForm() {
		return "/cs/inquiry";
	}
	
	@PostMapping("/inquiry/submit")
	public String inquirySubmit(InquiryDTO inquiryDTO) {
		csService.inquirySubmit(inquiryDTO);
		return "redirect:/cs/inquirylist";
	}
	
	@GetMapping("/inquirylist")
	public String inquiryList(HttpSession session, HttpServletRequest request, Model model) {
		
		String member_id = (String) session.getAttribute("member_id");
		
		PageDTO pageDTO = new PageDTO();
		String pageNum = request.getParameter("pageNum");
		String searchKey = request.getParameter("search");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10;
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		
		if(searchKey != null && !searchKey.isEmpty()) {
			pageDTO.setSearch(searchKey);
		}
		
		List<InquiryDTO> inquiryList = csService.getMyInquiryList(pageDTO, member_id);
		int count = csService.getMyInquiryCount(member_id);
		
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
		model.addAttribute("inquiryList", inquiryList);
		
		return "/cs/inquiry_list";
	}
	
	@GetMapping("/inquirydetail")
	public String inquiryDetail(@RequestParam int inquiry_id, Model model) {
		InquiryDTO inquiryDTO = csService.inquiryDetail(inquiry_id);
		model.addAttribute("inquiryDTO", inquiryDTO);
		return "cs/inquiry_detail";
	}
	
}
