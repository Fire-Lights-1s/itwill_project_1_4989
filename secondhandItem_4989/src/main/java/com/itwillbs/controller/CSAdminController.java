package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
@RequestMapping("/admin/cs")
public class CSAdminController {

	@Inject
	private CSService csService;

	@GetMapping("/notice")
	public String noticeAdmin(HttpServletRequest request, Model model) {
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
		
		return "/admin/cs/notice/list";
	}
	
	@GetMapping("/noticeform")
	public String noticeForm() {
		return "/admin/cs/notice/form";
	}
	
	@PostMapping("/submitNotice")
	public String submitNotice(NoticeDTO noticeDTO) {
		csService.submitNotice(noticeDTO);
		return "redirect:/admin/cs/notice";
	}
	
	@GetMapping("/noticedetail")
	public String noticeDetail(@RequestParam int notice_id, Model model) {
		NoticeDTO noticeDTO = csService.noticeDetail(notice_id);
		model.addAttribute("noticeDTO", noticeDTO);
		return "/admin/cs/notice/detail";
	}
	
	@GetMapping("/notice/edit")
	public String editNotice(@RequestParam int notice_id, Model model) {
		NoticeDTO noticeDTO = csService.noticeDetail(notice_id);
		model.addAttribute("noticeDTO", noticeDTO);
		return "/admin/cs/notice/edit";
	}
	
	@PostMapping("/editNotice")
	public String editNoticePro(NoticeDTO noticeDTO) {
		csService.editNotice(noticeDTO);
		return "redirect:/admin/cs/notice";
	}
	
	@GetMapping("/notice/delete")
	public String deleteNotice(@RequestParam int notice_id) {
		csService.deleteNotice(notice_id);
		return "redirect:/admin/cs/notice";
	}
	
	
	@GetMapping("/faq")
	public String faqAdmin(HttpServletRequest request, Model model) {
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
		
		return "/admin/cs/faq/list";
	}
	
	@GetMapping("/faqform")
	public String faqForm() {
		return "/admin/cs/faq/form";
	}
	
	@PostMapping("/submitFaq")
	public String submitFaq(FaqDTO faqDTO) {
		csService.submitFaq(faqDTO);
		return "redirect:/admin/cs/faq";
	}
	
	@GetMapping("/faqdetail")
	public String faqDetail(@RequestParam int faq_id, Model model) {
		FaqDTO faqDTO = csService.faqDetail(faq_id);
		model.addAttribute("faqDTO", faqDTO);
		return "/admin/cs/faq/detail";
	}
	
	@GetMapping("/faq/edit")
	public String editFaq(@RequestParam int faq_id, Model model) {
		FaqDTO faqDTO = csService.faqDetail(faq_id);
		model.addAttribute("faqDTO", faqDTO);
		return "/admin/cs/faq/edit";
	}
	
	@PostMapping("/editFaq")
	public String editFaqPro(FaqDTO faqDTO) {
		csService.editFaq(faqDTO);
		return "redirect:/admin/cs/faq";
	}
	
	@GetMapping("/faq/delete")
	public String deleteFaq(@RequestParam int faq_id) {
		csService.deleteFaq(faq_id);
		return "redirect:/admin/cs/faq";
	}
	
	
	@GetMapping("/inquiry")
	public String inquiryAdmin(HttpServletRequest request, Model model) {
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
		
		List<InquiryDTO> inquiryList = csService.getInquiryList(pageDTO);
		int count = csService.getInquiryCount(pageDTO);
		
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
		
		return "/admin/cs/inquiry/list";
	}
	
	@GetMapping("/inquirymanage")
	public String inquiryManage(@RequestParam int inquiry_id, Model model) {
		InquiryDTO inquiryDTO = csService.inquiryDetail(inquiry_id);
		model.addAttribute("inquiryDTO", inquiryDTO);
		return "/admin/cs/inquiry/manage";
	}
	
	@PostMapping("/inquiry/reply")
	public String inquiryReply(@RequestParam int inquiry_id, InquiryDTO inquiryDTO) {
		inquiryDTO.setInquiry_id(inquiry_id);
		csService.inquiryReply(inquiryDTO);
		return "redirect:/admin/cs/inquiry";
	}
	
}
