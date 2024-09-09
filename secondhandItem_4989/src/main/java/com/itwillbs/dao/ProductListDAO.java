package com.itwillbs.dao;

import java.util.List;

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
	
}
