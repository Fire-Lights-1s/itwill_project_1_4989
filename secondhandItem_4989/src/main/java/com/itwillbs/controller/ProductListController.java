package com.itwillbs.controller;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.ProductListService;

@Controller
@RequestMapping("/product")
public class ProductListController {

	@Inject
	private ProductListService productListService;
	
	@GetMapping("/a")
	public String getProductListAll(Model model) {
		
		// 상품 목록 넘겨주기
		List<ProductDTO> productList = productListService.getProductListAll();
		model.addAttribute("productList", productList);
		
		// 등록 후 경과시간 계산해서 넘겨주기
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
		model.addAttribute("elapsedTimeList", elapsedTimeList);
		
		return "product/all";
	}
	
	@GetMapping("/{category_name}")
	public String getListByCategory(@PathVariable String category_name, Model model) {
		
		// 상품 목록 넘겨주기
		List<ProductDTO> productList = productListService.getListByCategory(category_name);
		model.addAttribute("productList", productList);
		
		// 등록 후 경과시간 계산해서 넘겨주기
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
		model.addAttribute("elapsedTimeList", elapsedTimeList);
		
		return "product/all";
	}
	
}
