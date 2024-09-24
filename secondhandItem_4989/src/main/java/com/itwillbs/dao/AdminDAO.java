package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReportDTO;

@Repository
public class AdminDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.AdminMapper";
	
	public List<ReportDTO> getReportList(PageDTO pageDTO) {
		List<ReportDTO> reportList = sqlSession.selectList(namespace+".getReportList", pageDTO);
		return reportList;
	}


	public int getReportCount(PageDTO pageDTO) {
		int count = sqlSession.selectOne(namespace+".getReportCount", pageDTO);
		return count;
	}


	public void updateReport(ReportDTO reportDTO) {
		sqlSession.update(namespace+".updateReport", reportDTO);
	}

	//member
	public List<MemberDTO> getMemberList(PageDTO pageDTO) {
		List<MemberDTO> memberList = sqlSession.selectList(namespace+".getMemberList", pageDTO);
		return memberList;
	}
	
	public int getMemberCount(PageDTO pageDTO) {
		int count = sqlSession.selectOne(namespace+".getMemberCount", pageDTO);
		return count;
	}
	
	public int memberCount(MemberDTO memberDTO) {
		System.out.println("AdminDAO memberCount()");
		
		return sqlSession.selectOne(namespace + ".memberCount", memberDTO);
	}
	
	public int productCount(MemberDTO memberDTO) {
		System.out.println("AdminDAO productCount()");
		
		return sqlSession.selectOne(namespace + ".productCount", memberDTO);
	}
	
	public int purchaseCount(MemberDTO memberDTO) {
		System.out.println("AdminDAO purchaseCount()");
		
		return sqlSession.selectOne(namespace + ".purchaseCount", memberDTO);
	}
	
	public int reportCount(MemberDTO memberDTO) {
		System.out.println("AdminDAO reportCount()");
		
		return sqlSession.selectOne(namespace + ".reportCount", memberDTO);
	}

}
