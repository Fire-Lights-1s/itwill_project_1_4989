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
	
//글 조회수
//	public int getMaxNum() {
//		System.out.println("BoardDAO getMaxNum()");
//		return sqlSession.selectOne(namespace + ".getMaxNum");
//	}

	public void insertProduct(ProductDTO productDTO) {
		System.out.println("ProductDAO insertProduct()");
		sqlSession.insert(namespace + ".insertProduct", productDTO);
		
	}

	public ProductDTO getProductDetail(String product_id) {
		System.out.println("ProductDAO productDetail()");
		return sqlSession.selectOne(namespace + ".getProductDetail", product_id);
		
	}
	
//	public List<ProductDTO> getProductList (ProductDTO productDTO){
//		System.out.println("ProductDAO getProductList()");
//		return sqlSession.selectList(namespace, ".getProductList", productDTO);
//	}
	
	


}
