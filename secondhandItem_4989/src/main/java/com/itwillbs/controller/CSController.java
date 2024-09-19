package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.NoticeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.CSAdminService;

@Controller
@RequestMapping("/cs")
public class CSController {

	@Inject
	private CSAdminService csAdminService;
	
	
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
			
			List<NoticeDTO> noticeList = csAdminService.getNoticeList(pageDTO);
			int count = csAdminService.getNoticeCount(pageDTO);
			
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
	
	
	
	
}
