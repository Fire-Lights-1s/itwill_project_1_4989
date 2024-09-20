package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.CSDAO;
import com.itwillbs.domain.FaqDTO;
import com.itwillbs.domain.InquiryDTO;
import com.itwillbs.domain.NoticeDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class CSService {

	@Inject
	private CSDAO csDAO;

	public List<NoticeDTO> getNoticeList(PageDTO pageDTO) {
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		return csDAO.getNoticeList(pageDTO);
	}

	public int getNoticeCount(PageDTO pageDTO) {
		return csDAO.getNoticeCount(pageDTO);
	}

	public List<FaqDTO> getFaqList(PageDTO pageDTO) {
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		return csDAO.getFaqList(pageDTO);
	}

	public int getFaqCount(PageDTO pageDTO) {
		return csDAO.getFaqCount(pageDTO);
	}

	public List<InquiryDTO> getInquiryList(PageDTO pageDTO) {
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		return csDAO.getInquiryList(pageDTO);
	}

	public int getInquiryCount(PageDTO pageDTO) {
		return csDAO.getInquiryCount(pageDTO);
	}

	public void submitNotice(NoticeDTO noticeDTO) {
		csDAO.submitNotice(noticeDTO);		
	}

	public void submitFaq(FaqDTO faqDTO) {
		csDAO.submitFaq(faqDTO);
	}

	public NoticeDTO noticeDetail(int notice_id) {
		return csDAO.noticeDetail(notice_id);
	}

	public void editNotice(NoticeDTO noticeDTO) {
		csDAO.editNotice(noticeDTO);		
	}

	public void deleteNotice(int notice_id) {
		csDAO.deleteNotice(notice_id);		
	}

	public FaqDTO faqDetail(int faq_id) {
		return csDAO.faqDetail(faq_id);
	}

	public void editFaq(FaqDTO faqDTO) {
		csDAO.editFaq(faqDTO);
	}

	public void deleteFaq(int faq_id) {
		csDAO.deletFaq(faq_id);
	}

	public void inquirySubmit(InquiryDTO inquiryDTO) {
		inquiryDTO.setInquired_at(new Timestamp(System.currentTimeMillis()));
		csDAO.inquirySubmit(inquiryDTO);
	}

	public InquiryDTO inquiryDetail(int inquiry_id) {
		return csDAO.inquiryDetail(inquiry_id);
	}

	public List<InquiryDTO> getMyInquiryList(PageDTO pageDTO, String member_id) {
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		Map<String, Object> inquiryMap = new HashMap<>();
		inquiryMap.put("pageDTO", pageDTO);
		inquiryMap.put("member_id", member_id);
		return csDAO.getMyInquiryList(inquiryMap);
	}

	public int getMyInquiryCount(String member_id) {
		return csDAO.getMyInquiryCount(member_id);
	}

	public void inquiryReply(InquiryDTO inquiryDTO) {
		inquiryDTO.setReplied_at(new Timestamp(System.currentTimeMillis()));
		csDAO.inquiryReply(inquiryDTO);
	}
	
	
}