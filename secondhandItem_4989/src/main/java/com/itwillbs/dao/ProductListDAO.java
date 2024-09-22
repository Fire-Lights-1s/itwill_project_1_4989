package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductDTO;

@Repository
public class ProductListDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.ProductListMapper";
	
	public List<ProductDTO> getPopList() {
		return sqlSession.selectList(namespace + ".getPopList");
	}

	public List<ProductDTO> loadMoreList(int offset, int itemsPerPage, String listName) {
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("offset", offset);
		paramMap.put("itemsPerPage", itemsPerPage);
		
		if (listName.equals("pop")) {
			return sqlSession.selectList(namespace + ".loadMorePopList", paramMap);
		} else {
			return null;
		}	
	}

	public List<ProductDTO> getProductList(Map<String, Object> paramMap) {
		return sqlSession.selectList(namespace + ".getProductList", paramMap);
	}
}
