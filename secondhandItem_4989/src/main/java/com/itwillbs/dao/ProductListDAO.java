package com.itwillbs.dao;

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
	
	public List<ProductDTO> getProductListAll() {
		return sqlSession.selectList(namespace + ".getProductListAll");
	}
	public List<ProductDTO> getProductListByC(String category_name) {
		return sqlSession.selectList(namespace + ".getProductListByC", category_name);
	}
	public List<ProductDTO> getFilteredProducts(Map<String, Object> paramMap) {
		return sqlSession.selectList(namespace + ".getFilteredProducts", paramMap);
	}
	public List<ProductDTO> getItemsBySearch(String query) {
		String value = "%" + query + "%";		
	    return sqlSession.selectList(namespace + ".getItemsBySearch", value);
	}
	
}
