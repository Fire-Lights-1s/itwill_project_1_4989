package com.itwillbs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.service.MyPageService;

@Controller
@RequestMapping("/my/*")
public class MyPageController {
	
	@GetMapping("/profile")
	public String profile() {
		System.out.println("MyPageController profile()");
		return "my/profile";
	}
	
	@GetMapping("/infoCheck")
	public String infoCheck() {
		System.out.println("MyPageController infoCheck()");
		return "my/infoCheck";
	}
	
	@GetMapping("/infoUpdate")
	public String infoUpdate() {
		System.out.println("MyPageController infoUpdate()");
		return "my/infoUpdate";
	}
	
	@GetMapping("/sell")
	public String sell() {
		System.out.println("MyPageController sell()");
		return "my/sell";
	}
}