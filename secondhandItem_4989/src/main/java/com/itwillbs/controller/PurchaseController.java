package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.itwillbs.domain.PurchaseItemsDTO;
import com.itwillbs.domain.PurchaseRequestDTO;
import com.itwillbs.service.PurchaseService;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	
	@Inject
	private PurchaseService purchaseService;
	
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
	public String getItemsByCategory(@RequestParam String category_name, Model model) {
		List<PurchaseItemsDTO> items = purchaseService.getItemsByCategory(category_name);
		model.addAttribute("category_name", category_name);
		model.addAttribute("items", items);
		return "purchase/regi/item";
	}
	
	@GetMapping("/search")
	public String getItemsByCategory(@RequestParam String category_name, @RequestParam String query, Model model) {
		List<PurchaseItemsDTO> items = purchaseService.getItemsBySearch(category_name, query);
		model.addAttribute("category_name", category_name);
		model.addAttribute("items", items);
		return "purchase/regi/item";
	}
	
	@GetMapping("/form")
	public String getForm(@RequestParam String name, @RequestParam String grade, @RequestParam int price, Model model) {
		model.addAttribute("pc_item_name", name);
		model.addAttribute("expected_grade", grade);
		model.addAttribute("expected_price", price);	
		return "purchase/regi/form";
	}

	@PostMapping("/registerPurchase")
	public String registerPurchase(PurchaseRequestDTO purchaseRequestDTO) {
		purchaseService.register(purchaseRequestDTO);
		return "redirect:pcComplete";
	}
	
	@GetMapping("/pcComplete")
	public String purchaseComplete() {
		return "purchase/regi/complete";
	}
	
	
}