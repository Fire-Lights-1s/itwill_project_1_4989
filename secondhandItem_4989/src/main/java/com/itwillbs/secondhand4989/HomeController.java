package com.itwillbs.secondhand4989;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.ProductListService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Inject
	private ProductListService productListService;
	
	@RequestMapping("/")
	public String home(Model model) {
		// 인기상품 목록 넘겨주기
		List<ProductDTO> popList = productListService.getPopList();
		model.addAttribute("popList", popList);
		
		// 등록 후 경과시간 계산해서 넘겨주기
		List<String> elapsedTimeList = productListService.getElapsedTimeList(popList);
		model.addAttribute("elapsedTimeList", elapsedTimeList);
	    
		return "index";
	}
	
	@RequestMapping("/sample1")
	public String sample1() {
		return "sample_content";
	}
	
	@RequestMapping("/sample2")
	public String sample2() {
		return "sample_side_content";
	}
	
	
}
