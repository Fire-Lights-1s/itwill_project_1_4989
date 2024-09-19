package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.CSAdminDAO;
import com.itwillbs.domain.FaqDTO;
import com.itwillbs.domain.InquiryDTO;
import com.itwillbs.domain.NoticeDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class CSAdminService {

	@Inject
	private CSAdminDAO csAdminDAO;

	public List<NoticeDTO> getNoticeList(PageDTO pageDTO) {
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		return csAdminDAO.getNoticeList(pageDTO);
	}

	public int getNoticeCount(PageDTO pageDTO) {
		return csAdminDAO.getNoticeCount(pageDTO);
	}

	public List<FaqDTO> getFaqList(PageDTO pageDTO) {
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		return csAdminDAO.getFaqList(pageDTO);
	}

	public int getFaqCount(PageDTO pageDTO) {
		return csAdminDAO.getFaqCount(pageDTO);
	}

	public List<InquiryDTO> getInquiryList(PageDTO pageDTO) {
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		return csAdminDAO.getInquiryList(pageDTO);
	}

	public int getInquiryCount(PageDTO pageDTO) {
		return csAdminDAO.getInquiryCount(pageDTO);
	}

	public void submitNotice(NoticeDTO noticeDTO) {
		csAdminDAO.submitNotice(noticeDTO);		
	}

	public void submitFaq(FaqDTO faqDTO) {
		csAdminDAO.submitFaq(faqDTO);
	}

	public NoticeDTO noticeDetail(int notice_id) {
		return csAdminDAO.noticeDetail(notice_id);
	}

	public void editNotice(NoticeDTO noticeDTO) {
		csAdminDAO.editNotice(noticeDTO);		
	}

	public void deleteNotice(int notice_id) {
		csAdminDAO.deleteNotice(notice_id);		
	}

	public FaqDTO faqDetail(int faq_id) {
		return csAdminDAO.faqDetail(faq_id);
	}

	public void editFaq(FaqDTO faqDTO) {
		csAdminDAO.editFaq(faqDTO);
	}

	public void deleteFaq(int faq_id) {
		csAdminDAO.deletFaq(faq_id);
	}
	
	
}