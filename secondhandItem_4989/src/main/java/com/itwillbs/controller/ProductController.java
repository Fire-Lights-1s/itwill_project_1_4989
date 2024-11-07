package com.itwillbs.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.ReportDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.ProductService;
import com.itwillbs.service.ZzimService;

@Controller
@RequestMapping("/product/*")

public class ProductController {

	@Inject
	private ProductService productService;
	
	@Inject
	private MemberService memberService;

	@Inject
	private ZzimService zzimService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@GetMapping("/register")
	public String register(HttpSession session) {
		// 로그인한 사람만 글쓰기
		String member_id = (String) session.getAttribute("member_id");
		return "product/register";

	}

	@PostMapping("/registerPro")
	public String registerPro(MultipartHttpServletRequest request, HttpSession session) throws Exception {

	    System.out.println("ProductController registerPro()");
	    System.out.println("uploadPath: " + uploadPath);

	    // 파일 필드 이름 "product_img"로 파일 리스트를 받아옴
	    List<MultipartFile> files = request.getFiles("product_img");

	    ProductDTO productDTO = new ProductDTO();
	    
	    // 로그인한 사용자 ID를 DTO에 설정
	    productDTO.setSeller_id((String) session.getAttribute("member_id"));

	    // JSP 폼에서 전달된 기타 정보도 DTO에 설정
	    productDTO.setProduct_name(request.getParameter("product_name"));
	    productDTO.setCategory_name(request.getParameter("category_name"));
	    productDTO.setProduct_price(Integer.parseInt(request.getParameter("product_price")));
	    productDTO.setTrade_area(request.getParameter("trade_area"));
	    productDTO.setTrade_method(request.getParameter("trade_method"));
	    productDTO.setPay_method(request.getParameter("pay_method"));
	    productDTO.setProduct_desc(request.getParameter("product_desc"));

	    // 저장된 파일 이름을 저장할 리스트
	    List<String> savedFileNames = new ArrayList<>();

	    // 파일 처리
	    for (MultipartFile file : files) {
	        if (file != null && !file.isEmpty()) {
	            // 파일을 저장할 고유한 이름 생성
	            String uniqueFilename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

	            // 파일 저장 처리
	            File destinationFile = new File(uploadPath, uniqueFilename);
	            file.transferTo(destinationFile); // 파일 저장

	            // 고유 파일명을 리스트에 추가
	            savedFileNames.add(uniqueFilename);

	            // 로그 출력
	            System.out.println("Saved file: " + uniqueFilename);
	        }
	    }
	    
	    

	    // ProductDTO에 저장된 파일 이름을 설정
	    productService.registerProduct(productDTO, savedFileNames);

	    return "redirect:/product";
	}//register



	@GetMapping("/detail")
	public String detail(HttpServletRequest request, Model model, HttpSession session) throws Exception {

		String product_id = request.getParameter("product_id");
		// product_id가 없거나 잘못된 경우에 대한 예외 처리
		if (product_id == null || product_id.isEmpty()) {
			throw new IllegalArgumentException("Invalid product_id");
		}

		// 현재 로그인한 사용자 확인
		String member_id = (String) session.getAttribute("member_id");
		// 로그인하지 않은 경우를 처리
		if (member_id == null || member_id.isEmpty()) {
			member_id = ""; // 로그인하지 않은 상태에서는 member_id를 빈 값으로 설정
		}

		// 조회수 증가 처리
		productService.increseViewCount(Integer.parseInt(product_id));

		// 상품 상세 정보
		ProductDTO productDTO = productService.getProductDetail(product_id);
		
		//판매자의 nickname을 조회**
	    String seller_id = productDTO.getSeller_id();
	    MemberDTO memDTO = memberService.getMember(seller_id);  // MemberDTO로부터 닉네임 조회
	    String seller_nickname = memDTO.getNickname();  // 판매자의 닉네임

		// 판매자와 로그인 사용자 일치여부 확인, 수정 가능 여부 결정
		boolean canEdit = productDTO.getSeller_id().equals(member_id);

		// 찜 여부 확인을 위한 요청 데이터 생성
		Map<String, String> zzimRequest = new HashMap<>();
		zzimRequest.put("product_id", product_id);
		zzimRequest.put("member_id", member_id);

		boolean isZzimSaved = false;

		// 로그인한 경우에만 찜 여부 확인
		if (!member_id.isEmpty()) {
			isZzimSaved = zzimService.checkZzim(zzimRequest);
		}

		System.out.println("ZzimRequest: " + zzimRequest);
		System.out.println("Zzim Saved: " + isZzimSaved);

		// 모델에 필요한 정보 추가
		model.addAttribute("productDTO", productDTO);
		model.addAttribute("isZzimSaved", isZzimSaved);
		model.addAttribute("canEdit", canEdit);
		model.addAttribute("sellerNickname", seller_nickname); 

		return "/product/detail";
	}
	@PostMapping("/ZzimCount")
	@ResponseBody
	public int ZzimCount(String product_id) {
		
		int result = productService.getLikeCount(Integer.parseInt(product_id));
		return result;
	}
	@GetMapping("/update")
	public String update(@RequestParam("product_id") String product_id, Model model, HttpSession session)
			throws Exception {
		// 현재 로그인한 사용자 확인
		String member_id = (String) session.getAttribute("member_id");

		// 상품 정보 조회
		ProductDTO productDTO = productService.getProductDetail(product_id);

		// 모델에 상품 정보를 추가하여 update.jsp로 전달
		model.addAttribute("productDTO", productDTO);

		return "product/update"; 
	}
	
	@PostMapping("/updatePro")
	public String updatePro(MultipartHttpServletRequest request, HttpSession session) throws Exception {
	    // 상품 ID 가져오기
	    String productId = request.getParameter("product_id");
	    ProductDTO productDTO = productService.getProductDetail(productId);

	    // 파일 리스트 가져오기
	    List<MultipartFile> files = request.getFiles("product_img");
	    List<String> savedFileNames = new ArrayList<>();

	    // 파일 처리 로직
	    for (MultipartFile file : files) {
	        if (!file.isEmpty()) {
	            String uniqueFilename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
	            File destinationFile = new File(uploadPath, uniqueFilename);
	            file.transferTo(destinationFile);
	            savedFileNames.add(uniqueFilename);
	        }
	    }

	    // 상품 수정 서비스 호출
	    productService.updateProduct(productDTO, savedFileNames);

	    return "redirect:/product";
	}


	/*
	 * @PostMapping("/updatePro") public String updateProductPro(ProductDTO
	 * productDTO,
	 * 
	 * @RequestParam(value = "product_img[]", required = false) MultipartFile[]
	 * newFiles, HttpServletRequest request, HttpSession session) throws Exception {
	 * 
	 * // 로그인한 사용자 확인 String member_id = (String) session.getAttribute("member_id");
	 * 
	 * // 유효성 검사: 상품 정보 및 로그인 여부 확인 if (productDTO == null ||
	 * productDTO.getProduct_id() == 0 || member_id == null) { throw new
	 * IllegalArgumentException("유효하지 않은 요청입니다."); }
	 * 
	 * // 데이터베이스에서 상품의 실제 등록자 ID(seller_id) 가져오기 ProductDTO existingProduct =
	 * productService.getProductDetail(String.valueOf(productDTO.getProduct_id()));
	 * 
	 * // 로그인한 사용자와 상품 등록자 일치 여부 확인 if
	 * (!member_id.equals(existingProduct.getSeller_id())) { throw new
	 * IllegalArgumentException("수정 권한이 없습니다."); }
	 * 
	 * // **삭제된 이미지 처리 부분에서 null 값 체크 추가** String[] deletedImages =
	 * request.getParameter("deletedImages") != null ?
	 * request.getParameter("deletedImages").split(",") : new String[0];
	 * 
	 * for (String imageName : deletedImages) { if (imageName != null &&
	 * !imageName.isEmpty()) { // 이미지 파일 경로 String filePath =
	 * session.getServletContext().getRealPath("/resources/upload/" + imageName);
	 * 
	 * // 실제 파일 삭제 File file = new File(filePath); if (file.exists()) {
	 * file.delete(); // 파일 삭제 System.out.println("파일 삭제됨: " + filePath); }
	 * 
	 * // 데이터베이스에서 이미지 필드 업데이트 if
	 * (imageName.equals(existingProduct.getProduct_img1())) {
	 * productDTO.setProduct_img1(null); } else if
	 * (imageName.equals(existingProduct.getProduct_img2())) {
	 * productDTO.setProduct_img2(null); } else if
	 * (imageName.equals(existingProduct.getProduct_img3())) {
	 * productDTO.setProduct_img3(null); } else if
	 * (imageName.equals(existingProduct.getProduct_img4())) {
	 * productDTO.setProduct_img4(null); } else if
	 * (imageName.equals(existingProduct.getProduct_img5())) {
	 * productDTO.setProduct_img5(null); } } }
	 * 
	 * 
	 * // 상품 정보 수정 productService.updateProduct(productDTO, null);
	 * 
	 * // 수정 후 상품의 상세 페이지로 리다이렉트 return "redirect:/product/detail?product_id=" +
	 * productDTO.getProduct_id(); }
	 */



	// 신고하기
	@PostMapping("/report")
	@ResponseBody
	public Map<String, Object> submitReport(@RequestParam("reporter_id") String reporterId,
			@RequestParam("reportee_id") String reporteeId, @RequestParam("reported_item_id") int reportedItemId,
			@RequestParam("report_type") String reportType, @RequestParam("report_contents") String reportContents) {

		Map<String, Object> response = new HashMap<>();

		try {
			// 신고 정보를 DTO에 담아 Service로 전달
			ReportDTO reportDTO = new ReportDTO();
			reportDTO.setReporter_id(reporterId);
			reportDTO.setReportee_id(reporteeId);
			reportDTO.setReported_item_id(reportedItemId);
			reportDTO.setReport_type(reportType);
			reportDTO.setReport_contents(reportContents);
			reportDTO.setReport_status("접수"); // 초기 상태는 '접수'

			productService.submitReport(reportDTO);
			response.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("success", false);
			response.put("message", "신고 처리 중 오류가 발생했습니다.");
		}

		return response;
	}
	//상품 삭제
	@GetMapping("/delete")
	public String deleteProduct(@RequestParam("product_id") int product_id, HttpSession session) throws Exception {
	    // 로그인한 사용자 ID 가져오기
	    String member_id = (String) session.getAttribute("member_id");

	    // 상품 정보 가져오기
	    ProductDTO product = productService.getProductDetail(String.valueOf(product_id));

	    // 로그인한 사용자가 판매자인지 확인
	    if (product != null && product.getSeller_id().equals(member_id)) {
	        productService.deleteProduct(product_id);
	        return "redirect:/product"; 
//	        
	    } else {
	        return "redirect:/product/detail?product_id=" + product_id + "&error=unauthorized";  // 권한 없음 에러 처리
	    }
	}


}// ProductController()