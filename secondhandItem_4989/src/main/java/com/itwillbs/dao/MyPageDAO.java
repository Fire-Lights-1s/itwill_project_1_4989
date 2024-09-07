package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;

@Repository
public class MyPageDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.itwillbs.mapper.MyPageMapper";
	
	public List<ProductDTO> getProductList(PageDTO pageDTO) {
		System.out.println("MyPageDAO getProductList()");
		return sqlSession.selectList(namespace + ".getProductList", pageDTO);
	}

	public int getProductCount(ProductDTO productDTO) {
		System.out.println("MyPageDAO getProductCount()");
		return sqlSession.selectOne(namespace + ".getProductCount", productDTO);
	}
	
	
	
	
}
