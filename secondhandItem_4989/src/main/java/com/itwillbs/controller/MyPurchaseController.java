package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/my")
public class MyPurchaseController {

	@GetMapping("/purchlist")
	public String getPurchList() {
		return "my/purch/list";
	}
	
	@GetMapping("/purchdetail")
	public String getPurchDetail() {
		return "my/purch/detail";
	}
	
}
