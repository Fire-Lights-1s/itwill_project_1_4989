package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.PurchaseRequestDTO;
import com.itwillbs.service.PurchaseService;

@Controller
@RequestMapping("/my")
public class MyPurchaseController {

	@Inject
	private PurchaseService purchaseService;
	
	@GetMapping("/purchlist")
	public String getPurchList(HttpSession session, Model model) {
		String member_id = (String) session.getAttribute("member_id");
		List<PurchaseRequestDTO> list = purchaseService.getPurchList(member_id);
		model.addAttribute("list", list);
		return "my/purch/list";
	}
	
	@GetMapping("/purchdetail")
	public String getPurchDetail(@RequestParam int purchase_id, Model model) {
		PurchaseRequestDTO detail = purchaseService.getPurchDetail(purchase_id);
		model.addAttribute("detail", detail);
		return "my/purch/detail";
	}
	
	@GetMapping("/cancel")
	public String cancelRequest(@RequestParam int purchase_id) {
		purchaseService.cancelRequest(purchase_id);		
		return "redirect:purchlist";
	}
	
}
