package com.itwillbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.BanksDTO;
import com.itwillbs.domain.PurchaseItemsDTO;
import com.itwillbs.domain.PurchaseRequestDTO;
import com.itwillbs.service.AccountApiService;
import com.itwillbs.service.PurchaseService;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	
	@Inject
	private PurchaseService purchaseService;
	@Inject
	private AccountApiService accountApiService;
	
	
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
	public String getForm(@RequestParam String name, @RequestParam String grade, @RequestParam int price, HttpSession session, Model model) {
		List<BanksDTO> banks = purchaseService.getBankInfo();
		String member_id = (String) session.getAttribute("member_id");
		String member_name = purchaseService.getMemberName(member_id);
		model.addAttribute("pc_item_name", name);
		model.addAttribute("expected_grade", grade);
		model.addAttribute("expected_price", price);
		model.addAttribute("member_name", member_name);
		model.addAttribute("banks", banks);
		return "purchase/regi/form";
	}
	
	@PostMapping("/validate-account")
	public ResponseEntity<Map<String, Boolean>> validateAccount(@RequestBody Map<String, String> request) {
		
		if (accountApiService == null) {
	        throw new IllegalStateException("accountApiService is null!");
	    }
		
		String bank_code = request.get("bank_code");
		String bank_account = request.get("bank_account");
		String member_name = request.get("member_name");
		
		System.out.println(bank_code);
		System.out.println(bank_account);
		System.out.println(member_name);
		
		
        // 유효성 검사 (예금주 = 사용자이름 ?)
		String accountHolder = accountApiService.getAccountHolder(bank_code, bank_account);
		System.out.println(accountHolder);
	    boolean isValid = Objects.equals(accountHolder, member_name);
	    
        Map<String, Boolean> response = new HashMap<>();
        response.put("valid", isValid);
        
        return ResponseEntity.ok(response);
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