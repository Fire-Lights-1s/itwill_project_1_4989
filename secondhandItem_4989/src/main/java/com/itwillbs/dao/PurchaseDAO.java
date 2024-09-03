package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PurchaseItemsDTO;

@Repository
public class PurchaseDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.PurchaseMapper";

	public List<PurchaseItemsDTO> getItemsByCategory(String category_name) {
		return sqlSession.selectList(namespace + ".getItemsByCategory", category_name);
	}

	public List<PurchaseItemsDTO> getItemsBySearch(String category_name, String query) {
		Map<String, Object> params = new HashMap<>();
	    
	    if (!category_name.equals("all")) {
	        params.put("category_name", category_name);
	    }
	    
	    if (!query.equals("")) {
	        params.put("query", "%" + query + "%");  // SQL의 LIKE 조건에 사용할 부분 문자열 검색
	    }
		
		    return sqlSession.selectList(namespace + ".getItemsBySearch", params);
	} 
	
	
	
}
