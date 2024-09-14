package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;

@Repository
public class AdminDAO {
	@Inject
	private SqlSession sqlSession;
	
	
	public void getReport(PageDTO pageDTO) {
		
	}
}
