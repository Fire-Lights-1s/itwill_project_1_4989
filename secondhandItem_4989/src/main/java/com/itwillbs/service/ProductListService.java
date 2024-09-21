package com.itwillbs.service;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.*;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProductListDAO;
import com.itwillbs.domain.ProductDTO;

@Service
public class ProductListService {

	@Inject
	private ProductListDAO productListDAO;

	public List<ProductDTO> getProductList(String category, String searchKey, int itemsPerPage, int offset) {

		String category_name = category;
		if (category.equals("all")) {
			category_name = null;
		}

		String search = null;
		if (searchKey != null) {
			search = "%" + searchKey + "%";
		}

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("category_name", category_name);
		paramMap.put("search", search);
		paramMap.put("itemsPerPage", itemsPerPage);
		paramMap.put("offset", offset);
		paramMap.put("trade_status", "able"); // 초기 필터값과 맞춰주기 위한 조치

		return productListDAO.getProductList(paramMap);
	}

	public List<ProductDTO> getProductList(String category, List<String> method, List<String> pay, String price,
										   List<String> status, String sorting, Integer minPrice, Integer maxPrice,
										   String search, int itemsPerPage, int offset) {

		// 필터 값 데이터베이스 변수에 맞춰 전처리

		String category_name = Optional.ofNullable(category).filter(c -> !"all".equals(c)).orElse(null);
		String trade_method = Optional.ofNullable(method).filter(m -> m.size() == 1).map(m -> m.get(0)).orElse(null);
		String pay_method = Optional.ofNullable(pay).filter(p -> p.size() == 1).map(p ->p.get(0)).orElse(null);
		String trade_status = Optional.ofNullable(status).filter(s -> s.size() == 1).map(s -> s.get(0)).orElse(null);

		Integer startPrice = null;
		Integer endPrice = null;

		if (price != null) {
			if (minPrice == null && maxPrice == null) {            // 직접 입력해 지정한 값이 하나도 없을 때 (버튼으로만 선택한 경우)

				if (price.equals("all")) {                // 전체
					startPrice = null;
					endPrice = null;
				} else if (price.equals("free")) {        // 나눔
					startPrice = 0;
					endPrice = 0;
				} else if (price.equals("under_10")) {    // 10만원 이하
					startPrice = 1;
					endPrice = 100000;
				} else if (price.equals("under_30")) {    // 10~30만원
					startPrice = 100001;
					endPrice = 300000;
				} else if (price.equals("under_50")) {    // 30~50만원
					startPrice = 300001;
					endPrice = 500000;
				}

			} else {                                            // 직접 입력해 지정한 값이 하나라도 있을 때
				startPrice = minPrice == null ? 0 : minPrice;
				endPrice = maxPrice == null ? 0 : maxPrice;
			}
		}
		// 필터 처리한 값 + 다른 파라미터들 DAO로 보내기 전 맵에 저장
		Map<String, Object> paramMap = new HashMap<>();
		// 필터 처리한 값
		paramMap.put("category_name", category_name);
		paramMap.put("trade_method", trade_method);
		paramMap.put("pay_method", pay_method);
		paramMap.put("trade_status", trade_status);
		paramMap.put("sorting", sorting);
		paramMap.put("startPrice", startPrice);
		paramMap.put("endPrice", endPrice);
		// 다른 파라미터들
		if (search != null) {
			paramMap.put("search", "%" + search + "%");
		}
		paramMap.put("itemsPerPage", itemsPerPage);
		paramMap.put("offset", offset);

		return productListDAO.getProductList(paramMap);
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



	// 메인 인기상품 리스트 출력용

	public List<ProductDTO> getPopList() {
		return productListDAO.getPopList();
	}

	public List<ProductDTO> loadMoreList(int offset, int itemsPerPage, String listName) {
		return productListDAO.loadMoreList(offset, itemsPerPage, listName);
	}

}