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
	

	//상품 등록
	public void insertProduct(ProductDTO productDTO) {
		System.out.println("ProductDAO insertProduct()");
		sqlSession.insert(namespace + ".insertProduct", productDTO);
		
	}
	//상품 상세 정보
	public ProductDTO getProductDetail(String product_id) {
		System.out.println("ProductDAO productDetail()");
		ProductDTO productDTO = sqlSession.selectOne(namespace + ".getProductDetail", product_id);
		/*
		 * if (productDTO == null) { System.out.println("No product found with ID: " +
		 * product_id); } return productDTO;
		 */
		return sqlSession.selectOne(namespace + ".getProductDetail", product_id);
		
	}
	//찜 개수 like_count 증가
	public void increaseLikeCount(int product_id) {
		System.out.println("ProductDAO increaseLikeCount");
		sqlSession.update(namespace + ".increseLikeCount", product_id);
	}	

	 //찜 개수 조회
	 public int getLikeCount(int product_id) {
		 return sqlSession.selectOne(namespace + ".getLikeCount", product_id);
	 }
	 
	 //조회수 view_count 증가
	 public int getMaxNum(int product_id) { 
	 System.out.println("ProductDAO getMaxNum()"); 
	 sqlSession.selectOne(namespace + ".getMaxNum", product_id);
	return sqlSession.selectOne(namespace + ".getMaxNum", product_id);

	}
	
		
	
	
}
