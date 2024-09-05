package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@GetMapping("/")
	public String main() {
		return "/admin/sample";
	}
	
//	@GetMapping("/member")
//	public String member() {
//		return "/admin/member/list";
//	}
//	
//	@GetMapping("/trade")
//	public String trade() {
//		return "/admin/trade";
//	}
//	
//	@GetMapping("/purchase")
//	public String puchase() {
//		return "/admin/puchase/list";
//	}
//	
//	@GetMapping("/pay")
//	public String pay() {
//		return "/admin/pay/list";
//	}
//	
//	@GetMapping("/cs")
//	public String cs() {
//		return "/admin/cs/report";
//	}
//	
//	@GetMapping("/notice")
//	public String main() {
//		return "/admin/";
//	}
//	
//	@GetMapping("/")
//	public String main() {
//		return "/admin/sample";
//	}
//	
//	@GetMapping("/")
//	public String main() {
//		return "/admin/sample";
//	}
	
}
