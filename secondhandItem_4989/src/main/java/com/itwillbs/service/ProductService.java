package com.itwillbs.service;



import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProductDAO;
import com.itwillbs.domain.ProductDTO;


@Service
public class ProductService {
	@Inject
	ProductDAO productDAO = new ProductDAO();
	
	public void insertProduct(ProductDTO productDTO) {
		
	
	}//insertProduct


	
}//ProductService
