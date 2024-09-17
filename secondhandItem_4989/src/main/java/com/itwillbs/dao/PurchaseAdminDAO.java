package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PurchaseRequestDTO;

@Repository
public class PurchaseAdminDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.PurchaseAdminMapper";

	public int getReportCount(PageDTO pageDTO) {
		int count = sqlSession.selectOne(namespace+".getProductInfo", pageDTO);
		return count;
	}

	public List<PurchaseRequestDTO> getPurchaseList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getPurchaseList", pageDTO);
	}

	public int getPurchaseCount() {
		return sqlSession.selectOne(namespace + ".getPurchaseCount");
	}	
	
}
