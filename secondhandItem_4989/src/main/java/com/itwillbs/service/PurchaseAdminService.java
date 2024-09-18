package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.PurchaseAdminDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PurchaseRequestDTO;

@Service
public class PurchaseAdminService {
	
	@Inject
	private PurchaseAdminDAO purchaseAdminDAO;
	
	public List<PurchaseRequestDTO> getPurchaseList(PageDTO pageDTO) {
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		return purchaseAdminDAO.getPurchaseList(pageDTO);
	}

	public int getPurchaseCount(PageDTO pageDTO) {
		return purchaseAdminDAO.getPurchaseCount(pageDTO);
	}

	public void savePurchaseInfo(Map<String, Object> saveData) {
		purchaseAdminDAO.savePurchaseInfo(saveData);
	}
}
