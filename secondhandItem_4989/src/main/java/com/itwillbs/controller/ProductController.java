package com.itwillbs.controller;

import java.io.File;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.ProductService;

import jakarta.annotation.Resource;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
//	@Inject
//	private ProductService productService;
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@GetMapping("/register")
	public String main() {
		return "/product/register";
	}

	@PostMapping("/registerPro")
	public String registerPro(HttpServletRequest request, MultipartFile file) throws Exception  {
	     System.out.println("ProductController registerPro()");
	     UUID uuid = UUID.randomUUID();
	     String filename = uuid.toString()+"_"+file.getOriginalFilename();
			System.out.println("업로드 경로 : " + uploadPath);
			System.out.println("랜덤문자_파일이름 : " + filename);
			
			FileCopyUtils.copy(file.getBytes(), new File(uploadPath,filename));
	     
	     return "redirect:/product/all";
	    }
	
	@GetMapping("/all")
	public String all() {
		return "/product/all";
	}
	
	@GetMapping("/detail")
	public String detail() {
		return "/product/detail";
	}
	

	
}//ProductController()
	





















