package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.ProductDTO;

@Repository
public class ProductDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.itwillbs.mapper.ProductMapper";

	// 상품 등록
	public void insertProduct(ProductDTO productDTO) {
		System.out.println("ProductDAO insertProduct()");
		sqlSession.insert(namespace + ".insertProduct", productDTO);

	}

	// 상품 상세 정보
	public ProductDTO getProductDetail(String product_id) {
		System.out.println("ProductDAO productDetail()");
		ProductDTO productDTO = sqlSession.selectOne(namespace + ".getProductDetail", product_id);
		/*
		 * if (productDTO == null) { System.out.println("No product found with ID: " +
		 * product_id); } return productDTO;
		 */
		return sqlSession.selectOne(namespace + ".getProductDetail", product_id);

	}

	// 찜 개수 조회
	public int getLikeCount(int product_id) {
		return sqlSession.selectOne(namespace + ".getLikeCount", product_id);
	}

	// 조회수 view_count 증가

	public void increaseViewCount(int product_id) {
		System.out.println("ProductDAO increaseViewCount()");
		sqlSession.selectOne(namespace + ".increaseViewCount", product_id);

	}

	// 찜 개수 증가
	@Transactional
	public void increaseLikeCount(int product_id) {
		System.out.println("ProductDAO increaseLikeCount()");
		sqlSession.selectOne(namespace + ".increaseLikeCount", product_id);

	}
	// update Product
	public void updateProduct(ProductDTO productDTO) {
	    System.out.println("ProductDAO updateProduct() - ProductDTO: " + productDTO);
	    int result = sqlSession.update(namespace + ".updateProduct", productDTO);
	    
	    try {
	        int result1 = sqlSession.update(namespace + ".updateProduct", productDTO);
	        System.out.println("Update result: " + result1);
	    } catch (Exception e) {
	        e.printStackTrace(); 
	    }
	    
	    System.out.println("Update result: " + result);
	}


}
