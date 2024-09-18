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
	
	public PageDTO getPageDTOStartEndBoard(PageDTO pageDTO) {
		PageDTO page = pageDTO; 
		int pageSize = page.getPageSize();
		int currentPage = page.getCurrentPage();
		int pageCount = (int) Math.ceil(page.getCount() / (double)pageSize);
		//page.getCount() + (pageSize - (page.getCount() % pageSize)) % pageSize
		
		if(currentPage > pageCount) {
			currentPage = pageCount;
		}
		page.setCurrentPage(currentPage);
		page.setPageCount(pageCount);
		page.setStartRow((currentPage-1)*pageSize + 1);
		page.setEndRow(currentPage*pageSize);
		
		return page;
	}
	public List<ReportDTO> getReportList(Object object) {
		// TODO Auto-generated method stub
		return null;
	}

	public int getReportCount(PageDTO pageDTO) {
		int count = adminDAO.getReportCount(pageDTO);
		return count;
	}
	
	
}
