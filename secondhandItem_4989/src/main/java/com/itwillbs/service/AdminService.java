package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.AdminDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReportDTO;

@Service
public class AdminService {
	@Inject
	private AdminDAO adminDAO;
	
	public void getStartEndRow(PageDTO pageDTO) {
		PageDTO page = pageDTO; 
		int pageSize = page.getPageSize();
		int currentPage = page.getCurrentPage();
		int pageCount = (int) Math.ceil(page.getCount() / (double)pageSize);
		//page.getCount() + (pageSize - (page.getCount() % pageSize)) % pageSize
		
		if(currentPage < 1) {
			currentPage = 1;
		}
		if(currentPage > pageCount) {
			currentPage = pageCount;
		}
		page.setCurrentPage(currentPage);
		page.setPageCount(pageCount);
		page.setStartRow((currentPage-1)*pageSize);
		page.setEndRow(currentPage*pageSize);
		
	}
	public void getStartEndPage(PageDTO pageDTO) {
		int pageBlock = pageDTO.getPageBlock();
		int currentPage = pageDTO.getCurrentPage();
		int startPage = ((currentPage-1)/pageBlock)*pageBlock +1;
		int endPage = ((currentPage-1)/pageBlock)*pageBlock+pageBlock;
		if(pageDTO.getPageCount() <startPage ) {
			startPage = pageDTO.getPageCount();
		}
		if(pageDTO.getPageCount() <endPage ) {
			endPage = pageDTO.getPageCount();
		}
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
	}
	public List<ReportDTO> getReportList(PageDTO pageDTO) {
		getStartEndRow(pageDTO);
		getStartEndPage(pageDTO);
		
		List<ReportDTO> reportList = adminDAO.getReportList(pageDTO);
		return reportList;
	}

	public int getReportCount(PageDTO pageDTO) {
		int count = adminDAO.getReportCount(pageDTO);
		return count;
	}
	public ReportDTO updateReport(ReportDTO reportDTO) {
		adminDAO.updateReport(reportDTO);
		return reportDTO;
	}
	
	
}
