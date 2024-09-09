package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProductListDAO;
import com.itwillbs.domain.ProductDTO;

@Service
public class ProductListService {

	@Inject
	private ProductListDAO productListDAO;

	public List<ProductDTO> getProductListAll() {
		return productListDAO.getProductListAll();
	}
	
	public List<ProductDTO> getListByCategory(String category_name) {
		return productListDAO.getProductListByC(category_name);
	}
	
	
	
}
