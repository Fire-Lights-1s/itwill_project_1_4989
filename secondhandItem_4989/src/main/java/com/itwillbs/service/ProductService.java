package com.itwillbs.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.time.Duration;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.itwillbs.dao.ProductDAO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.ReportDTO;


@Service
public class ProductService {
	@Inject
	ProductDAO productDAO;
	ZzimService zzimService;
	
	//상품 등록
	public void registerProduct(ProductDTO productDTO) {
		System.out.println("ProductService registerProduct()");
		//등록 시간
        productDTO.setCreated_datetime(new Timestamp(System.currentTimeMillis())); 
        //조회수 0 설정
        productDTO.setView_count(0);
        productDAO.insertProduct(productDTO);  // DB에 상품 정보 저장
    }
	
	//상품 상세 조회
		public ProductDTO getProductDetail(String product_id) throws Exception {
			System.out.println(product_id);
			ProductDTO product = productDAO.getProductDetail(product_id);
			System.out.println(product);
			if (product != null) {
		        // 경과 시간 계산
		        String elapsedTime = getElapsedTime(product.getCreated_datetime());
		        product.setElapsedTime(elapsedTime);

		        // 찜 개수 조회 및 설정
		        int like_count = productDAO.getLikeCount(Integer.parseInt(product_id));
	            product.setLike_count(like_count);
		        //Map<String, String> zzimRequest = new HashMap<>();
		        //zzimRequest.put("product_id", product_id);
		        
		      
		    } else {
		        System.out.println("No product found with ID: " + product_id);
		    }
	        
	        return product;
			
		}//getProductDetail
		
		
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
		 
		// 찜 개수 증가 (중복 체크 포함)
		 public void increaseLikeCount(int product_id, String member_id) {
		        // 찜 상태 확인
		        Map<String, String> zzimRequest = new HashMap<>();
		        zzimRequest.put("product_id", String.valueOf(product_id));
		        zzimRequest.put("member_id", member_id);
		        
		        // 이미 찜한 상태인지 확인
		        boolean isZzimSaved = zzimService.checkZzim(zzimRequest);

		        if (!isZzimSaved) {
		            // 찜하지 않은 상태면 찜 추가
		            productDAO.increaseLikeCount(product_id);
		            zzimService.saveZzim(zzimRequest); // Zzim 테이블에 추가
		        } else {
		            System.out.println("이미 찜한 상품입니다.");
		        }
		    }

		 //찜 개수 조회
		public int getLikeCount(int product_id) {
			
			return productDAO.getLikeCount(product_id);
		}
		//조회수 증가 
		public void increseViewCount(int product_id) {
			productDAO.increaseViewCount(product_id);
		}
		
		//판매 상품 수정
		public void updateProduct(ProductDTO productDTO) throws Exception {
		    // 기존 상품 정보 조회
		    ProductDTO existingProduct = productDAO.getProductDetail(String.valueOf(productDTO.getProduct_id()));

		    // **노란색 하이라이트: 새로 업로드된 이미지가 없으면 기존 이미지를 유지**
		    if (productDTO.getProduct_img1() == null || productDTO.getProduct_img1().isEmpty()) {
		        productDTO.setProduct_img1(existingProduct.getProduct_img1());
		    }
		    if (productDTO.getProduct_img2() == null || productDTO.getProduct_img2().isEmpty()) {
		        productDTO.setProduct_img2(existingProduct.getProduct_img2());
		    }
		    if (productDTO.getProduct_img3() == null || productDTO.getProduct_img3().isEmpty()) {
		        productDTO.setProduct_img3(existingProduct.getProduct_img3());
		    }
		    if (productDTO.getProduct_img4() == null || productDTO.getProduct_img4().isEmpty()) {
		        productDTO.setProduct_img4(existingProduct.getProduct_img4());
		    }
		    if (productDTO.getProduct_img5() == null || productDTO.getProduct_img5().isEmpty()) {
		        productDTO.setProduct_img5(existingProduct.getProduct_img5());
		    }

		    // **노란색 하이라이트: 새로 업로드된 이미지가 있으면 기존 이미지를 덮어씀**
		    if (productDTO.getProduct_img1() != null && !productDTO.getProduct_img1().isEmpty()) {
		        // 새로운 이미지 처리 로직이 이미 ProductController에서 처리되므로 여기서는 단순히 DTO를 업데이트
		    }
		    if (productDTO.getProduct_img2() != null && !productDTO.getProduct_img2().isEmpty()) {
		        // 같은 방식으로 처리
		    }
		    if (productDTO.getProduct_img3() != null && !productDTO.getProduct_img3().isEmpty()) {
		        // 같은 방식으로 처리
		    }
		    if (productDTO.getProduct_img4() != null && !productDTO.getProduct_img4().isEmpty()) {
		        // 같은 방식으로 처리
		    }
		    if (productDTO.getProduct_img5() != null && !productDTO.getProduct_img5().isEmpty()) {
		        // 같은 방식으로 처리
		    }

		    // 상품 정보 업데이트
		    productDAO.updateProduct(productDTO);
		}

		
		//상품 신고
		public void submitReport(ReportDTO reportDTO) {
			productDAO.insertReport(reportDTO);
			
		}


	
	
}//ProductService
