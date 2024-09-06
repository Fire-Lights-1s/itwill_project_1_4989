package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.PurchaseDAO;
import com.itwillbs.domain.BanksDTO;
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

	public List<PurchaseRequestDTO> getPurchList(String member_id) {	
		return purchaseDAO.getPurchList(member_id);
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

}
