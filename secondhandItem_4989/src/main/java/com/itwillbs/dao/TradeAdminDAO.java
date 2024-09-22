package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;

@Repository
public class TradeAdminDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.TradeAdminMapper";
	
	// 거래 목록을 페이지네이션을 통해 가져오는 메서드
    public List<ProductDTO> getTradeList(PageDTO pageDTO) {
        return sqlSession.selectList("com.itwillbs.mapper.TradeAdminMapper.getTradeList", pageDTO);
    }

    // 거래 목록의 총 개수를 가져오는 메서드
    public int getTradeCount(PageDTO pageDTO) {
        return sqlSession.selectOne(namespace + ".getTradeCount", pageDTO);
    }

    // 거래 상세 정보를 저장하는 메서드
    public void saveTradeInfo(Map<String, Object> saveData) {
        sqlSession.update(namespace + ".saveTradeInfo", saveData);
    }

    // 특정 거래의 상세 정보를 가져오는 메서드
    public ProductDTO getTradeDetail(int product_id) {
        return sqlSession.selectOne(namespace + ".getTradeDetail", product_id);
    }

}
