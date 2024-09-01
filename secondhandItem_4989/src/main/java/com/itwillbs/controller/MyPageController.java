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
	
	
}