package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.FaqDTO;
import com.itwillbs.domain.InquiryDTO;
import com.itwillbs.domain.NoticeDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class CSAdminDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.CSAdminMapper";

	public List<NoticeDTO> getNoticeList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getNoticeList", pageDTO);
	}

	public int getNoticeCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace + ".getNoticeCount");
	}

	public List<FaqDTO> getFaqList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getFaqList", pageDTO);
	}

	public int getFaqCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace + ".getFaqCount");
	}

	public List<InquiryDTO> getInquiryList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getInquiryList", pageDTO);
	}

	public int getInquiryCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace + ".getInquiryCount");
	}

	public void submitNotice(NoticeDTO noticeDTO) {
		sqlSession.insert(namespace + ".submitNotice", noticeDTO);	
	}

	public void submitFaq(FaqDTO faqDTO) {
		sqlSession.insert(namespace + ".submitFaq", faqDTO);
		
	}

	public NoticeDTO noticeDetail(int notice_id) {
		return sqlSession.selectOne(namespace + ".noticeDetail", notice_id);
	}

	public void editNotice(NoticeDTO noticeDTO) {
		sqlSession.update(namespace + ".editNotice", noticeDTO);
	}

	public void deleteNotice(int notice_id) {
		sqlSession.delete(namespace + ".deleteNotice", notice_id);
	}

	public FaqDTO faqDetail(int faq_id) {
		return sqlSession.selectOne(namespace + ".faqDetail", faq_id);
	}

	public void editFaq(FaqDTO faqDTO) {
		sqlSession.update(namespace + ".editFaq", faqDTO);
	}

	public void deletFaq(int faq_id) {
		sqlSession.delete(namespace + ".deleteFaq", faq_id);
	}
	
	

}
