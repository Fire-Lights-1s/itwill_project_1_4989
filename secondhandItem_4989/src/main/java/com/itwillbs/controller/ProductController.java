package com.itwillbs.controller;

import java.io.File;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.ProductService;

import javax.annotation.Resource;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Inject
	private ProductService productService;
	//업로드 파일경로 가져오기
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@GetMapping("/register")
	public String main() {
		return "/product/register";
	}

	@PostMapping("/registerPro")
	public String registerPro(ProductDTO productDTO, HttpSession session, Model model, MultipartFile file, HttpServletRequest request) throws Exception {
	     System.out.println("ProductController registerPro()");
//		중복된 파일명 방지	     
	    UUID uuid = UUID.randomUUID();
	    String filename = uuid.toString()+"_"+file.getOriginalFilename();
		System.out.println("업로드 경로 : " + uploadPath);
		System.out.println("랜덤문자_파일이름 : " + filename);
	     	
	     //업로드 파일
	     FileCopyUtils.copy(file.getBytes(), new File(uploadPath,filename));
	     
	     ProductDTO productDTO1 = new ProductDTO();
	     productDTO1.setCategory_name("category_name");
	     productDTO1.setSeller_id("seller_id");
	     productDTO1.setProduct_name("product_name");
	     productDTO1.setProduct_img1("product_img1");

	     productDTO1.setProduct_desc("product_desc");
	     productDTO1.setPay_method("pay_method");
    
	     productDTO.setSeller_id((String)session.getAttribute("member_id"));
	     
	     productService.registerProduct(productDTO);

	     return "redirect:/product/all";
	    }


//	FileCopyUtils.copy(file.getBytes(), new File(uploadPath,filename));
   
	
	@GetMapping("/all")
	public String all() {
		return "/product/all";
	}
	
	@GetMapping("/detail")
	public String detail(HttpServletRequest request, Model model) {
		String product_id = request.getParameter("product_id");
		ProductDTO productDTO = productService.getProductDetail(product_id);
		model.addAttribute("productDTO", productDTO);
		return "/product/detail";
		
	}

}//ProductController()
	












