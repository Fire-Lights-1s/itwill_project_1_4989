package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.TradeAdminDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;

@Service
public class TradeAdminService {
	
	@Inject
	private TradeAdminDAO tradeAdminDAO;  // TradeAdminDAO 주입
	
	// 거래 목록을 페이지네이션으로 가져오는 메서드
	public List<ProductDTO> getTradeList(PageDTO pageDTO) {
		// 페이지네이션 처리: 시작 행과 끝 행 계산
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		pageDTO.setStartRow(startRow - 1);  // MySQL은 0부터 시작하므로 -1
		pageDTO.setEndRow(endRow);
		
		// 거래 목록을 DAO에서 가져옴
		return tradeAdminDAO.getTradeList(pageDTO);
	}

	// 거래 목록의 총 개수를 가져오는 메서드
	public int getTradeCount(PageDTO pageDTO) {
		return tradeAdminDAO.getTradeCount(pageDTO);
	}

	// 거래 상세 정보를 저장하는 메서드
	public void saveTradeInfo(Map<String, Object> saveData) {
		tradeAdminDAO.saveTradeInfo(saveData);
	}

	// 특정 거래의 상세 정보를 가져오는 메서드
	public ProductDTO getTradeDetail(int product_id) {
		return tradeAdminDAO.getTradeDetail(product_id);
	}
}
