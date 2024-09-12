package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.PurchaseItemsDTO;
import com.itwillbs.service.ProductListService;

@Controller
@RequestMapping("/product")
public class ProductListController {

	@Inject
	private ProductListService productListService;
	
	@GetMapping("")
	public String getProductListAll(Model model) {
		
		// 상품 목록 넘겨주기
		List<ProductDTO> productList = productListService.getProductListAll();
		model.addAttribute("productList", productList);
		
		// 등록 후 경과시간 계산해서 넘겨주기
		List<String> elapsedTimeList = productListService.getElapsedTimeList(productList);
		model.addAttribute("elapsedTimeList", elapsedTimeList);
		
		return "product/list";
	}
	
	@GetMapping("/{category_name}")
	public String getListByCategory(@PathVariable String category_name, Model model) {
		
		// 상품 목록 넘겨주기
		List<ProductDTO> productList = productListService.getListByCategory(category_name);
		model.addAttribute("productList", productList);

		// 경과시간 넘겨주기
	    List<String> elapsedTimeList = productListService.getElapsedTimeList(productList);
		model.addAttribute("elapsedTimeList", elapsedTimeList);
		
		return "product/list";
	}
	
	
	@PostMapping("/filter")
	public String filterProducts(@RequestBody Map<String, Object> filters, Model model) {
	
		// 카테고리, 거래수단, 결제수단, 가격(버튼형), 거래상태 필터링 준비
	    String category = (String) filters.get("category");
	    List<String> method = (List<String>) filters.get("method");
	    List<String> pay = (List<String>) filters.get("pay");
	    String price = (String) filters.get("price");
	    List<String> status = (List<String>) filters.get("trade");
	    
	    // 맞춤 가격대 필터링 준비
	    Integer minPrice = filters.get("minPrice") != null ? Integer.parseInt((String) filters.get("minPrice")) : null;
	    Integer maxPrice = filters.get("maxPrice") != null ? Integer.parseInt((String) filters.get("maxPrice")) : null;
	    
	    
	    // 카테고리, 가격대, 체크박스 필터 조건에 맞는 상품을 가져옴
	    List<ProductDTO> productList = productListService.getFilteredProducts(category, method, pay, price, status, minPrice, maxPrice);
	    System.out.println(productList);
	    model.addAttribute("productList", productList);
	    
	    // 경과시간 넘겨주기
	    List<String> elapsedTimeList = productListService.getElapsedTimeList(productList);
		model.addAttribute("elapsedTimeList", elapsedTimeList);
	    
		return "product/list_fragment";
		
	}
	
	@GetMapping("/search")
	public String getItemsByCategory(@RequestParam String query, Model model) {
		
		List<ProductDTO> productList = productListService.getItemsBySearch(query);
		model.addAttribute("productList", productList);

		List<String> elapsedTimeList = productListService.getElapsedTimeList(productList);
		model.addAttribute("elapsedTimeList", elapsedTimeList);

		return "product/list";
	}
}
