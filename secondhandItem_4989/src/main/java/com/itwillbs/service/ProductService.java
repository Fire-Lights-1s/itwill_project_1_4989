package com.itwillbs.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProductDAO;
import com.itwillbs.domain.ProductDTO;


@Service
public class ProductService {
	@Inject
	ProductDAO productDAO = new ProductDAO();
	
	public void registerProduct(ProductDTO productDTO) {
		System.out.println("ProductService registerProduct()");
        productDTO.setCreated_datetime(new Timestamp(System.currentTimeMillis())); 
        productDAO.insertProduct(productDTO);  // DB에 상품 정보 저장
    }

	public ProductDTO getProductDetail(String product_id) {
		
		
		return productDAO.getProductDetail(product_id);
	}


	
}//ProductService
