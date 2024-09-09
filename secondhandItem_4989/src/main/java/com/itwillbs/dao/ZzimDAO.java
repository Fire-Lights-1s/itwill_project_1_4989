package com.itwillbs.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ZzimDAO {


	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.ZzimMapper";
	
	public boolean checkZzim(Map<String, String> request) {
		if (sqlSession.selectOne(namespace + ".checkZzim", request) == null) {
			return true;
		}
		return false;
	}
	
	public void saveZzim(Map<String, String> request) {
		sqlSession.insert(namespace + ".saveZzim", request);
	}

	public void deleteZzim(Map<String, String> request) {
		sqlSession.delete(namespace + ".deleteZzim", request);
	}

	

}
