package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.ReportDTO;

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
	public ProductDTO getProductDetail(String product_id) throws Exception{
		System.out.println("ProductDAO productDetail()");
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

	// 상품 업데이트
	public void updateProduct(ProductDTO productDTO) {
		// 기존 상품 정보 조회
		ProductDTO existingProduct = sqlSession.selectOne(namespace + ".getProductDetail", productDTO.getProduct_id());

		// 기존의 view_count, like_count, trade_status 값 유지
		productDTO.setView_count(existingProduct.getView_count());
		productDTO.setLike_count(existingProduct.getLike_count());
		productDTO.setTrade_status(existingProduct.getTrade_status());

		sqlSession.update(namespace + ".updateProduct", productDTO);
	}

	// 상품 신고
	public void insertReport(ReportDTO reportDTO) {
		sqlSession.insert(namespace + ".insertReport", reportDTO);

	}

}
