package com.itwillbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.ProductListService;

@Controller
public class ProductListController {

	@Inject
	private ProductListService productListService;

	@GetMapping("/product")
	public String getProductList(@RequestParam(defaultValue = "1") String page,
								 @RequestParam(defaultValue = "all") String category,
								 @RequestParam(required = false) String search, Model model) {

		// 페이지, 더보기 처리 준비
		int pageNum = Integer.parseInt(page);
		int itemsPerPage = 12;
		int offset = (pageNum - 1) * itemsPerPage;

		// 상품 목록 가져오기
		List<ProductDTO> productList = productListService.getProductList(category, search, itemsPerPage, offset);
		model.addAttribute("productList", productList);
		boolean isLastPage = productList.size() < itemsPerPage;
		model.addAttribute("isLastPage", isLastPage);

		// 등록 후 경과시간 계산해서 넘겨주기
		List<String> elapsedTimeList = productListService.getElapsedTimeList(productList);
		model.addAttribute("elapsedTimeList", elapsedTimeList);

		// 검색란에 검색어 유지
		model.addAttribute("search", search);

		if (pageNum > 1) {	// 더보기, 필터 동작시(이미 목록에 들어와있는 경우)에는 fragment로 화면 일부만 변경
			return "product/list_fragment";
		}
		return "product/list";	// 메뉴, 검색으로 상품목록에 진입하는 경우 페이지 전체 이동
	}

	@PostMapping("/product")
	public String getFilteredProductList(@RequestBody(required = false) Map<String, Object> requestData,
										 @RequestParam(required = false) String search, Model model) {

		// 페이지, 더보기 처리 준비
		int pageNum = 1;
		if (requestData.get("page") != null && !requestData.get("page").equals("")) {
			pageNum = Integer.parseInt(requestData.get("page").toString());
		}

		int itemsPerPage = 12;
		int offset = (pageNum - 1) * itemsPerPage;

		Map<String, Object> filters = (Map<String, Object>) requestData.get("filters"); // 중첩된 map이어서 filters만 꺼내서 처리
		String category = (String) filters.get("category");
		List<String> method = (List<String>) filters.get("method");
		List<String> pay = (List<String>) filters.get("pay");
		String price = (String) filters.get("price");
		List<String> status = (List<String>) filters.get("trade");
		String sorting = (String) filters.get("sorting");

		String minPriceStr = (String) filters.get("minPrice");
		String maxPriceStr = (String) filters.get("maxPrice");

		Integer minPrice = (minPriceStr != null && !minPriceStr.isEmpty()) ? Integer.parseInt(minPriceStr) : null;
		Integer maxPrice = (maxPriceStr != null && !maxPriceStr.isEmpty()) ? Integer.parseInt(maxPriceStr) : null;

		// 상품 목록 가져오기
		List<ProductDTO> productList = productListService.getProductList(category, method, pay, price, status, sorting, minPrice, maxPrice, search, itemsPerPage, offset);
		model.addAttribute("productList", productList);
		boolean isLastPage = productList.size() < itemsPerPage;
		model.addAttribute("isLastPage", isLastPage);

		// 등록 후 경과시간 계산해서 넘겨주기
		List<String> elapsedTimeList = productListService.getElapsedTimeList(productList);
		model.addAttribute("elapsedTimeList", elapsedTimeList);

		return "product/list_fragment";
	}

	// 메인 인기상품 리스트 더보기
	@GetMapping("/product/morelist")
	@ResponseBody
	public Map<String, Object> loadMoreList(@RequestParam int page, @RequestParam String listName) {
		int itemsPerPage = 12;
		int offset = (page - 1) * itemsPerPage;
		
		List<ProductDTO> products = productListService.loadMoreList(offset, itemsPerPage, listName);
		boolean isLastPage = products.size() < itemsPerPage;
		
		List<String> elapsedTimeList = productListService.getElapsedTimeList(products);
		
		Map<String, Object> response = new HashMap<>();
		response.put("products", products);
		response.put("isLastPage", isLastPage);
		response.put("elapsedTimeList", elapsedTimeList);
		
		return response;
	}
	
}
