package com.itwillbs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.PurchaseDAO;
import com.itwillbs.domain.BanksDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PurchaseItemsDTO;
import com.itwillbs.domain.PurchaseRequestDTO;

@Service
public class PurchaseService {
	
	@Inject
	private PurchaseDAO purchaseDAO;


	public List<PurchaseItemsDTO> getItemsByCategory(String category_name) {
		return purchaseDAO.getItemsByCategory(category_name);
	}

	public List<PurchaseItemsDTO> getItemsBySearch(String category_name, String query) {
		return purchaseDAO.getItemsBySearch(category_name, query);
	}

	public void register(PurchaseRequestDTO purchaseRequestDTO) {
		purchaseDAO.register(purchaseRequestDTO);
	}

	public List<PurchaseRequestDTO> getPurchList(PageDTO pageDTO, String member_id) {
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		Map<String, Object> purchaseMap = new HashMap<>();
		purchaseMap.put("pageDTO", pageDTO);
		purchaseMap.put("member_id", member_id);
		return purchaseDAO.getPurchList(purchaseMap);
	}

	public PurchaseRequestDTO getPurchDetail(int purchase_id) {
		return purchaseDAO.getPurchDetail(purchase_id);
	}

	public void cancelRequest(int purchase_id) {
		purchaseDAO.cancelRequest(purchase_id);
		
	}
	
	public List<BanksDTO> getBankInfo() {
		return purchaseDAO.getBankInfo();
	}

	public String getMemberName(String member_id) {
		return purchaseDAO.getMemberName(member_id);
	}

	public int getPurchCount(String member_id) {
		return purchaseDAO.getPurchCount(member_id);
	}

}
