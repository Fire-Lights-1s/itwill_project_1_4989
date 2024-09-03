package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.itwillbs.domain.PurchaseRequestDTO;

@Controller
@RequestMapping("/purchase")
@SessionAttributes("formData")
public class PurchaseController {
	
	@ModelAttribute("formData")
	public PurchaseRequestDTO formData() {
		return new PurchaseRequestDTO();
	}
	
	@GetMapping("/intro")
	public String intro() {
		return "purchase/intro";
	}
	
	@GetMapping("/register")
	public String category() {
		return "purchase/regi/category";
	}
	
	@GetMapping("/item")
	public String showItems(@RequestParam(name = "category", required = false) String category, Model model) {
		return "purchase/regi/item";
	}
	
	@GetMapping("/form")
	public String handleForm() {
		return "purchase/regi/form";
	}
	
}
