package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;

@Repository
public class AdminDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.AdminMapper";
	
	public void getReportList(PageDTO pageDTO) {
		
	}


	public int getReportCount(PageDTO pageDTO) {
		int count = sqlSession.selectOne(namespace+".getProductInfo", pageDTO);
		return count;
	}
}
