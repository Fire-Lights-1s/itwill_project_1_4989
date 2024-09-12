package com.itwillbs.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.Duration;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.itwillbs.dao.ProductDAO;
import com.itwillbs.domain.ProductDTO;


@Service
public class ProductService {
	@Inject
	ProductDAO productDAO = new ProductDAO();
	//상품 등록
	public void registerProduct(ProductDTO productDTO) {
		System.out.println("ProductService registerProduct()");
        productDTO.setCreated_datetime(new Timestamp(System.currentTimeMillis())); 
        productDAO.insertProduct(productDTO);  // DB에 상품 정보 저장
    }
	//상품 상세 조회
		public ProductDTO getProductDetail(String product_id) {
			ProductDTO product = productDAO.getProductDetail(product_id);
			// 경과 시간 계산
	        String elapsedTime = getElapsedTime(product.getCreated_datetime());
	        // 경과 시간 추가
	        product.setElapsedTime(elapsedTime);
	        return product;
			
		}
		
		//상품 등록 경과 시간
		 private String getElapsedTime(Timestamp createdTime) {
		        LocalDateTime now = LocalDateTime.now();
		        LocalDateTime createdDateTime = createdTime.toLocalDateTime();
		        Duration duration = Duration.between(createdDateTime, now);
		        
		        
		        long hours = duration.toHours();
		        if (hours >= 24) {
		            long days = duration.toDays();
		            return days + "일 전";
		        } else if (hours >= 1) {
		            return hours + "시간 전";
		        } else {
		            long minutes = duration.toMinutes() % 60;
		            return minutes + "분 전";
		        }
		    }
		 
		 //찜 개수 증가
		 public void increaseLikeCount(int product_id) {
			 productDAO.increaseCount(product_id);
	
		 }

	
	
}//ProductService
