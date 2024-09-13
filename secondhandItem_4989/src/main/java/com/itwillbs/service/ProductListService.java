package com.itwillbs.service;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProductListDAO;
import com.itwillbs.domain.ProductDTO;

@Service
public class ProductListService {

	@Inject
	private ProductListDAO productListDAO;

	public List<ProductDTO> getPopList() {
		return productListDAO.getPopList();
	}
	
	public List<ProductDTO> getProductListAll() {
		return productListDAO.getProductListAll();
	}
	
	public List<ProductDTO> getListByCategory(String category_name) {
		return productListDAO.getProductListByC(category_name);
	}

	
	public List<ProductDTO> getFilteredProducts(String category, List<String> method, List<String> pay, String price,
			List<String> status, Integer minPrice, Integer maxPrice) {
		
		// 사실상 조건 없이 전체를 가져와야 하는 경우, null로 두고 매퍼에서 동적쿼리를 짤 때 활용
		
		System.out.println("service start=" + category + method + pay + price + status + minPrice + maxPrice);
		
		
		String category_name = category;
		if (category.equals("all")) {
			category_name = null;
		}
		
		String trade_method = null;
		if (method != null && method.size() == 1) {
		    trade_method = method.get(0);
		}

		String pay_method = null;
		if (pay != null && pay.size() == 1) {
		    pay_method = pay.get(0);
		}

		String trade_status = null;
		if (status != null && status.size() == 1) {
		    trade_status = status.get(0);
		}
		
		Integer startPrice = 0;
		Integer endPrice = 0;
		
		if (minPrice == null && maxPrice == null) {			// 직접 지정값이 하나도 없을 때
	
			if (price.equals("all")) {
				startPrice = null;
				endPrice = null;
			} else if (price.equals("free")) {
				startPrice = 0;
				endPrice = 0;
			} else if (price.equals("under_10")) {
				startPrice = 1;
				endPrice = 100000;
			} else if (price.equals("under_30")) {
				startPrice = 100001;
				endPrice = 300000;
			} else if (price.equals("under_50")) {
				startPrice = 300001;
				endPrice = 500000;
			}
			
		} else {											// 직접 지정값이 하나라도 있을 때
			startPrice = minPrice;
			endPrice = maxPrice;
		}
		
		// 카테고리 - 그냥 들어가면 됨. all인 경우에만 동적쿼리로 처리
		// 거래방법 - length가 1이면 0번 인덱스값, length가 2이면 직거래/택배
		// 결제방법 - length가 1이면 0번 인덱스값, length가 2이면 현금/페이
		// 거래상태 - '거래 가능' / '예약 중', '거래 완료' 구분하여 후자만 동적쿼리로 처리
		// 가격 - startPrice, endPrice로 정리. 동적쿼리로 처리
		
		// 값 정리해서 dao로 보내기
	
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("category_name", category_name);
		paramMap.put("trade_method", trade_method);
		paramMap.put("pay_method", pay_method);
		paramMap.put("trade_status", trade_status);
		paramMap.put("startPrice", startPrice);
		paramMap.put("endPrice", endPrice);
		
		
		System.out.println("service end=" + paramMap);
		
		return productListDAO.getFilteredProducts(paramMap);
	}

	
	// 등록 후 경과시간 계산해서 넘겨주기
	public List<String> getElapsedTimeList(List<ProductDTO> productList) {
	    	LocalDateTime now = LocalDateTime.now();
		    List<String> elapsedTimeList = new ArrayList<>();
		    for (ProductDTO product : productList) {
		        LocalDateTime createdTime = product.getCreated_datetime().toLocalDateTime();
		        Duration duration = Duration.between(createdTime, now);
		        
		        String elapsedTime = new String();
		        long days = duration.toDays();
		        if (days >= 1) {
		        	elapsedTime = days + "일 전";
		        } else {
		        	long hours = duration.toHours();
		        	if (hours >= 1) {
		        		elapsedTime = hours + "시간 전";
		        		} else {
		        			long minutes = duration.toMinutes() % 60;
		        			elapsedTime = minutes + "분 전";
		        		}
		        }
		        elapsedTimeList.add(elapsedTime);
		    }
	        return elapsedTimeList;
	    }

	public List<ProductDTO> getItemsBySearch(String query) {
		return productListDAO.getItemsBySearch(query);
	}

	public List<ProductDTO> loadMorePopList(int offset, int itemsPerPage) {
		return productListDAO.loadMorePopList(offset, itemsPerPage);
	}
	
}
