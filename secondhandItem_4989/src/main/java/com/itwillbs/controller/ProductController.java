package com.itwillbs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	@Inject
	private ProductService productService;
	
	@GetMapping("/register")
	public String main() {
		return "/product/register";
	}

	@PostMapping("/registerPro")
	public String registerPro(ProductDTO productDTO) {
		productService.insertProduct(productDTO);
		return "redirect:/prouct/all";
		
	}


}//ProductController()


