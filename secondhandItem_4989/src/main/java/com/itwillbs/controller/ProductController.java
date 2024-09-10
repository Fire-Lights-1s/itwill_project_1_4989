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
import com.mysql.cj.Session;

import javax.annotation.Resource;

@Controller
@RequestMapping("/product/*")

public class ProductController {
	ProductDTO productDTO = new ProductDTO();

	@Inject
	private ProductService productService;
	// 업로드 파일경로 가져오기
	@Resource(name = "uploadPath")
	private String uploadPath;

	@GetMapping("/register")
	public String main() {
		return "/product/register";
	}

	@PostMapping("/registerPro")
	public String registerPro(HttpServletRequest request, MultipartFile product_img1, HttpSession session) throws Exception {
		System.out.println("ProductController registerPro()");
		//파일업로드
	    // 파일이 null인지 확인
	    if (product_img1 == null || product_img1.isEmpty()) {
	        System.out.println("파일이 선택되지 않았습니다.");
	        return "redirect:/product/register"; // 파일이 없을 경우 다시 등록 페이지로 이동
	    }

	    // 업로드 경로 확인
	    System.out.println("uploadPath: " + uploadPath);
	    if (uploadPath == null) {
	        System.out.println("업로드 경로가 설정되지 않았습니다.");
	        return "redirect:/product/register"; // 경로가 없을 경우 다시 등록 페이지로 이동
	    }
		

		// 중복 파일명 방지
		UUID uuid = UUID.randomUUID();
		System.out.println("--------------" + product_img1.getOriginalFilename());
		String filename = uuid.toString() + "_" + product_img1.getOriginalFilename();
		System.out.println("업로드 경로 : " + uploadPath);
		System.out.println("랜덤문자_파일이름 : " + filename);

		// 파일 복사 => 원하는 폴더, 파일이름 붙여넣기 => 복제
		FileCopyUtils.copy(product_img1.getBytes(), new File(uploadPath, filename));

		ProductDTO productDTO = new ProductDTO();
		productDTO.setProduct_name(request.getParameter("product_name"));
		productDTO.setCategory_name(request.getParameter("category_name"));
		productDTO.setProduct_price(Integer.parseInt(request.getParameter("product_price")));
		productDTO.setTrade_area(request.getParameter("trade_area"));
		productDTO.setTrade_method(request.getParameter("trade_method"));
		productDTO.setPay_method(request.getParameter("pay_method"));
		productDTO.setProduct_desc(request.getParameter("product_desc"));
		productDTO.setProduct_img1(filename);

		productDTO.setSeller_id((String) session.getAttribute("member_id"));

		// 구입연도 및 날짜 처리
		String yearPurchase = request.getParameter("year_purchase");
		if (yearPurchase != null && !yearPurchase.isEmpty()) {
			productDTO.setYear_purchase(Integer.parseInt(yearPurchase));
		}

		// ProductService 객체를 통해 DB에 저장
		productService.registerProduct(productDTO);

		return "redirect:/product/register";
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

}// ProductController()
