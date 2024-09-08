package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProductDAO;
import com.itwillbs.domain.ProductDTO;


@Service
public class ProductService {
	@Inject
	ProductDAO productDAO = new ProductDAO();
	
	public void registerProduct(ProductDTO productDTO) {
        // 이미지 필드는 null로 설정한 상태로 DB에 저장
        productDAO.insertProduct(productDTO);  // DB에 상품 정보 저장
    }

	public ProductDTO getProductDetail(String product_id) {
		// TODO Auto-generated method stub
		
		return productDAO.getProductDetail(product_id);
	}


	
}//ProductService
