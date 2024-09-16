package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.ZzimDTO;

@Repository
public class MyPageDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.itwillbs.mapper.MyPageMapper";
	
	public List<ProductDTO> getProductList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getProductList", pageDTO);
	}
	
	public int getProductCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace + ".getProductCount", pageDTO);
	}
	
	public List<ProductDTO> getZzimList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getZzimList", pageDTO);
	}
	
	public int getZzimCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace + ".getZzimCount", pageDTO);
	}

	public void deleteZzim(ZzimDTO zzimDTO) {
		sqlSession.delete(namespace + ".deleteZzim", zzimDTO);
	}

	public List<ProductDTO> getBuyList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getBuyList", pageDTO);
	}

	public int getBuyCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace + ".getBuyCount", pageDTO);
	}

	public void deleteMem(String member_id) {
		sqlSession.update(namespace + ".deleteMem", member_id);
	}

	public int allTX(String id) {
		return sqlSession.selectOne(namespace + ".allTX", id);
	}

	public void deleteSell(ProductDTO productDTO) {
		sqlSession.delete(namespace + ".deleteSell", productDTO);
	}

	public void updateReserv(ProductDTO productDTO) {
		sqlSession.update(namespace + ".updateReserv", productDTO);
	}
	
		
	
	
	
}
