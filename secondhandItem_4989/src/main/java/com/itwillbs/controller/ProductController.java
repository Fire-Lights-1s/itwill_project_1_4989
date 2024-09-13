package com.itwillbs.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.ProductService;
import com.itwillbs.service.ZzimService;

import javax.annotation.Resource;

@Controller
@RequestMapping("/product/*")

public class ProductController {

    @Inject
    private ProductService productService;
    private ZzimService zzimService;
    
    @Resource(name = "uploadPath")
    private String uploadPath;
    
    
    @GetMapping("/register")
    public String register(HttpSession session) {
    	//로그인한 사람만 글쓰기
    	String member_id = (String)session.getAttribute("member_id");
    	return "product/register";
    	
     }


    @PostMapping("/registerPro")
    public String registerPro(HttpServletRequest request, MultipartFile product_img1, HttpSession session) throws Exception {
        System.out.println("ProductController registerPro()");

        if (product_img1 == null || product_img1.isEmpty()) {
            System.out.println("파일이 선택되지 않았습니다.");
            return "redirect:/product/register";
        }

        System.out.println("uploadPath: " + uploadPath);
        if (uploadPath == null) {
            System.out.println("업로드 경로가 설정되지 않았습니다.");
            return "redirect:/product/register";
        }

        UUID uuid = UUID.randomUUID();
        String filename = uuid.toString() + "_" + product_img1.getOriginalFilename();
        System.out.println("업로드 경로 : " + uploadPath);
        System.out.println("랜덤문자_파일이름 : " + filename);

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
        //로그인한 사용자
        productDTO.setSeller_id((String) session.getAttribute("member_id"));

        String yearPurchase = request.getParameter("year_purchase");
        if (yearPurchase != null && !yearPurchase.isEmpty()) {
            productDTO.setYear_purchase(Integer.parseInt(yearPurchase));
        }
        System.out.println("ProductController" + productDTO);
        productService.registerProduct(productDTO);

        return "redirect:/product/all";
    }
	/*
	 * @GetMapping("/all") public String all() { return "/product/all"; }
	 */

    @GetMapping("/detail")
    public String detail(HttpServletRequest request, Model model, HttpSession session) throws NumberFormatException {
    	
    	  String product_id = request.getParameter("product_id");
    	  //product_id가 없거나 잘못된 경우에 대한 예외 처리
    	  if (product_id == null || product_id.isEmpty()) {
    	        throw new IllegalArgumentException("Invalid product_id");
    	    }
    	  System.out.println("Product ID: " + product_id);
    	  
          String member_id = (String) session.getAttribute("member_id");
          
        //상품 상세 정보
        ProductDTO productDTO = productService.getProductDetail(product_id);
       //모델에 필요한 정보 추가
        model.addAttribute("productDTO", productDTO);

        return "/product/detail";
    }


}// ProductController()
