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
	
	public List<ProductDTO> getProductListAll() {
		return sqlSession.selectList(namespace + ".getProductListAll");
	}
	
	public List<ProductDTO> getProductListByC(String category_name) {
		return sqlSession.selectList(namespace + ".getProductListByC", category_name);
	}
	
	public List<ProductDTO> getFilteredProducts(Map<String, Object> paramMap) {
		System.out.println(paramMap);
		return sqlSession.selectList(namespace + ".getFilteredProducts", paramMap);
	}
	
	public List<ProductDTO> getItemsBySearch(String query) {
		String value = "%" + query + "%";
	    return sqlSession.selectList(namespace + ".getItemsBySearch", value);
	}
	
	public List<ProductDTO> loadMoreList(int offset, int itemsPerPage, String listName) {
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("offset", offset);
		paramMap.put("itemsPerPage", itemsPerPage);
		
		if (listName.equals("pop")) {
			return sqlSession.selectList(namespace + ".loadMorePopList", paramMap);
		} else if (listName.equals("all")) {
			return sqlSession.selectList(namespace + ".loadMoreAllList", paramMap);
		} else if (listName.equals("category")) {
			return sqlSession.selectList(namespace + ".loadMoreCList", paramMap);
		} else if (listName.equals("filter")) {
			return sqlSession.selectList(namespace + ".loadMoreFilteredList", paramMap);
		} else if (listName.equals("search")) {
			return sqlSession.selectList(namespace + ".loadMoreSearchedList", paramMap);
		} else {
			return null;
		}	
	}
	
}
