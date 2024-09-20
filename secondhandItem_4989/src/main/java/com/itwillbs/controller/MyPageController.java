package com.itwillbs.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;
import java.time.temporal.ChronoUnit;

import javax.annotation.Resource;
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

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.ReviewDTO;
import com.itwillbs.domain.ZzimDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MyPageService;

@Controller
@RequestMapping("/my/*")
public class MyPageController {
	
	@Inject
	private MyPageService myPageService;
	
	@Inject
	private MemberService memberService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@GetMapping("/profile")
	public String profile(HttpSession session, Model model) {
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		memberDTO.setAllTX(myPageService.allTX(id)); 
		model.addAttribute("memberDTO", memberDTO);
		return "my/profile";
	}
	
	@GetMapping("/infoCheck")
	public String infoCheck(HttpSession session) {
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		return "my/infoCheck";
	}
	
	@PostMapping("/infoCheckPro")
	public String infoCheckPro(MemberDTO memberDTO, HttpSession session) {
		String id = (String)session.getAttribute("member_id");
		memberDTO.setMember_id(id);
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
		System.out.println(memberDTO2);
		if(memberDTO2 != null) {
			return "redirect:/my/infoUpdate";
		}else {
			return "redirect:/my/infoCheck";
		}
	}
	
	@GetMapping("/infoUpdate")
	public String infoUpdate(HttpSession session, Model model) {
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		model.addAttribute("memberDTO", memberDTO);
		return "my/infoUpdate";
	}
	
	@PostMapping("/infoUpdatePro")
	public String infoUpdatePro(HttpServletRequest request, MultipartFile file)throws Exception {
		String filename = "";
		if(file.isEmpty()) {
			filename = "51d26ab9-a276-4d41-9196-2f12cd1d1e28_defaultUserImage.png";
		}else {
			UUID uuid = UUID.randomUUID();
			filename = uuid.toString() + "_" + file.getOriginalFilename();
			FileCopyUtils.copy(file.getBytes(), new File(uploadPath, filename));
			File oldfile = new File(uploadPath, request.getParameter("oldfile"));
			if(oldfile.exists()) {
				oldfile.delete();
			}
		}
		String member_id = request.getParameter("member_id");
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String nickname = request.getParameter("nickname");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_id(member_id);
		memberDTO.setName(name);
		memberDTO.setPass(pass);
		memberDTO.setNickname(nickname);
		memberDTO.setPhone(phone);
		memberDTO.setEmail(email);
		memberDTO.setProfile_img(filename);
		memberService.updateMember(memberDTO);
		return "redirect:/my/profile";
	}
	
	@GetMapping("/sell")
	public String sell(HttpSession session, Model model, HttpServletRequest request) {
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		String pageNum = request.getParameter("pageNum");
		String sort = request.getParameter("sort");
		String sale = request.getParameter("sale");
		String nosell = request.getParameter("nosell");
		String noreserv = request.getParameter("noreserv");
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 8;
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		pageDTO.setSeller_id(id);
		pageDTO.setSort(sort);
		pageDTO.setSale(sale);
		if(nosell != null) {
			ProductDTO productDTO = new ProductDTO();
			productDTO.setProduct_id(Integer.parseInt(nosell));
			productDTO.setSeller_id(id);
			myPageService.deleteSell(productDTO);
		}
		if(noreserv != null) {
			ProductDTO productDTO = new ProductDTO();
			productDTO.setProduct_id(Integer.parseInt(noreserv));
			productDTO.setSeller_id(id);
			myPageService.updateReserv(productDTO);
		}
		List<ProductDTO> productList = myPageService.getProductList(pageDTO);
		int count = myPageService.getProductCount(pageDTO);
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("productList", productList);
		return "my/sell";
	}
	
	@GetMapping("/buy")
	public String buy(HttpSession session, Model model, HttpServletRequest request) {
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		String pageNum = request.getParameter("pageNum");
		String sort = request.getParameter("sort");
		String sale = request.getParameter("sale");
		String noreserv = request.getParameter("noreserv");
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 8;
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		pageDTO.setSeller_id(id);
		pageDTO.setSort(sort);
		pageDTO.setSale(sale);
		if(noreserv != null) {
			ProductDTO productDTO = new ProductDTO();
			productDTO.setProduct_id(Integer.parseInt(noreserv));
			productDTO.setSeller_id(id);
			myPageService.updateReserv(productDTO);
		}
		List<ProductDTO> productList = myPageService.getBuyList(pageDTO);
		int count = myPageService.getBuyCount(pageDTO);
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("productList", productList);
		return "my/buy";
	}
	
	@GetMapping("/zzim")
	public String zzim(HttpSession session, Model model, HttpServletRequest request) {
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		String pageNum = request.getParameter("pageNum");
		String sort = request.getParameter("sort");
		String product_id = request.getParameter("nozzim");
		ZzimDTO zzimDTO = new ZzimDTO();
		if(pageNum == null) {
			pageNum = "1";
		}
		if(product_id != null) {
			 zzimDTO.setProduct_id(Integer.parseInt(product_id));
			 zzimDTO.setMember_id(id);
			 myPageService.deleteZzim(zzimDTO);
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 8;
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		pageDTO.setSeller_id(id);
		pageDTO.setSort(sort);
		List<ProductDTO> productList = myPageService.getZzimList(pageDTO);
		int count = myPageService.getZzimCount(pageDTO);
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("productList", productList);
		return "my/zzim";
	}
	
	@PostMapping("/deleteMem")
	public String deleteMem(HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		myPageService.deleteMem(member_id);
		return "redirect:/";
	}
	
	@PostMapping("/reviewPro")
	public String reviewPro(HttpServletRequest request) {
		int product_id = Integer.parseInt(request.getParameter("productId"));
		int review_quality = Integer.parseInt(request.getParameter("qualityRating"));
		int review_price = Integer.parseInt(request.getParameter("priceRating"));
		int review_time = Integer.parseInt(request.getParameter("punctualityRating"));
		int review_manner = Integer.parseInt(request.getParameter("mannerRating"));
		if(review_quality <= 0) {
			review_quality = 1;
		}
		if(review_price <= 0) {
			review_price = 1;
		}
		if(review_time <= 0) {
			review_time = 1;
		}
		if(review_manner <= 0) {
			review_manner = 1;
		}
		String review_content = request.getParameter("reviewText");
		ReviewDTO reviewDTO = new ReviewDTO();
		reviewDTO.setProduct_id(product_id);
		reviewDTO.setReview_quality(review_quality);
		reviewDTO.setReview_price(review_price);
		reviewDTO.setReview_time(review_time);
		reviewDTO.setReview_manner(review_manner);
		reviewDTO.setReview_content(review_content);
		myPageService.insertReview(reviewDTO);
		myPageService.updateReviewStatus(product_id);
		return "redirect:/my/buy";
	}
	
	@GetMapping("/payPoint")
	public String payPoint(HttpSession session, Model model) {
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		model.addAttribute("memberDTO", memberDTO);
		
		return "/my/pay/point";
	}
	@GetMapping("/payAccount")
	public String payAccount(HttpSession session, Model model) {
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		model.addAttribute("memberDTO", memberDTO);
		
		return "/my/pay/account";
	}
	@GetMapping("/payCharge")
	public String payCharge(HttpSession session, Model model) {
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		model.addAttribute("memberDTO", memberDTO);
		
		return "/my/pay/charge";
	}
	@GetMapping("/paySend")
	public String paySend(HttpSession session, Model model) {
		String id = (String)session.getAttribute("member_id");
		MemberDTO memberDTO = memberService.getMember(id);
		
		if(memberDTO == null) {
			return "redirect:/member/login";
		}
		model.addAttribute("memberDTO", memberDTO);
		
		return "/my/pay/send";
	}
}