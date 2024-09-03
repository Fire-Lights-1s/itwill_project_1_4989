package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.PurchaseDAO;
import com.itwillbs.domain.PurchaseItemsDTO;

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

}
