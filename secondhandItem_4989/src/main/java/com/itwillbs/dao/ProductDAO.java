package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductDTO;

@Repository
public class ProductDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.ProductMapper";

//	public int getMaxNum() {
//		System.out.println("BoardDAO getMaxNum()");
//		return sqlSession.selectOne(namespace + ".getMaxNum");
//	}

	public void insertProduct(ProductDTO productDTO) {
		sqlSession.insert(namespace + ".insertProduct", productDTO);
		
	}


}
