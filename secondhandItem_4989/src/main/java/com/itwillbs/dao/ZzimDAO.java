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
		int returnValue = sqlSession.selectOne(namespace + ".checkZzim", request);
		if (returnValue == 0) {		// 등록된 게 없으면
			return false;			// 찜이 안된 거임 (false 반환)
		}
		return true;				// 그게 아니면 찜이 이미 존재함. (true 반환)
	}
	
	public void saveZzim(Map<String, String> request) {
		sqlSession.insert(namespace + ".saveZzim", request);
	}

	public void deleteZzim(Map<String, String> request) {
		sqlSession.delete(namespace + ".deleteZzim", request);
	}

	

}
