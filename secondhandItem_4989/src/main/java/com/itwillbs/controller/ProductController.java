package com.itwillbs.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.ReportDTO;
import com.itwillbs.service.ProductService;
import com.itwillbs.service.ZzimService;

@Controller
@RequestMapping("/product/*")

public class ProductController {

	@Inject
	private ProductService productService;

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
	public String registerPro(HttpServletRequest request, MultipartFile[] product_img, HttpSession session)
			throws Exception {
		System.out.println("ProductController registerPro()");
		System.out.println("uploadPath: " + uploadPath);
		if (uploadPath == null) {
			System.out.println("업로드 경로가 설정되지 않았습니다.");
			return "redirect:/product/register";
		}

		/*
		 * UUID uuid = UUID.randomUUID(); String filename = uuid.toString() + "_" +
		 * product_img1.getOriginalFilename();
		 */

		/*
		 * FileCopyUtils.copy(product_img1.getBytes(), new File(uploadPath, filename));
		 */

		ProductDTO productDTO = new ProductDTO();
		productDTO.setProduct_name(request.getParameter("product_name"));
		productDTO.setCategory_name(request.getParameter("category_name"));
		productDTO.setProduct_price(Integer.parseInt(request.getParameter("product_price")));
		productDTO.setTrade_area(request.getParameter("trade_area"));
		productDTO.setTrade_method(request.getParameter("trade_method"));
		productDTO.setPay_method(request.getParameter("pay_method"));
		productDTO.setProduct_desc(request.getParameter("product_desc"));

		/*
		 * productDTO.setProduct_img1(filename1); productDTO.setProduct_img2(filename2);
		 * productDTO.setProduct_img3(filename3); productDTO.setProduct_img4(filename4);
		 * productDTO.setProduct_img5(filename5);
		 */

		// 로그인한 사용자
		productDTO.setSeller_id((String) session.getAttribute("member_id"));

		// 업로드된 파일이 있는지 확인 후 처리 (각 파일에 대해 고유 UUID 생성)
		for (int i = 0; i < product_img.length; i++) {
			if (product_img[i] != null && !product_img[i].isEmpty()) {
				UUID uuid = UUID.randomUUID(); // 각 파일에 대해 새로운 UUID 생성
				String filename = uuid.toString() + "_" + product_img[i].getOriginalFilename();

				System.out.println("랜덤문자_파일이름 : " + filename);

				FileCopyUtils.copy(product_img[i].getBytes(), new File(uploadPath, filename));

				// 업로드된 파일의 순서대로 파일명을 DTO에 저장
				if (i == 0)
					productDTO.setProduct_img1(filename);
				if (i == 1)
					productDTO.setProduct_img2(filename);
				if (i == 2)
					productDTO.setProduct_img3(filename);
				if (i == 3)
					productDTO.setProduct_img4(filename);
				if (i == 4)
					productDTO.setProduct_img5(filename);
			}
		}
		// 업로드된 파일이 없으면 null 설정
		if (product_img[1] == null || product_img[1].isEmpty()) {
		    productDTO.setProduct_img2(null);
		}
		if (product_img[2] == null || product_img[2].isEmpty()) {
		    productDTO.setProduct_img3(null);
		}
		if (product_img[3] == null || product_img[3].isEmpty()) {
		    productDTO.setProduct_img4(null);
		}
		if (product_img[4] == null || product_img[4].isEmpty()) {
		    productDTO.setProduct_img5(null);
		}
		
		// 파일이 최소 1개 이상 업로드되었는지 확인
		boolean hasFile = false;
		for (MultipartFile file : product_img) {
		    if (file != null && !file.isEmpty()) {
		        hasFile = true;
		        break;
		    }
		}

		if (!hasFile) {
		    // 파일이 하나도 없을 때 처리 (에러 메시지 출력 또는 페이지 리다이렉트)
		    System.out.println("최소 1개의 파일을 업로드해야 합니다.");
		    return "redirect:/product/register";  // 다시 업로드 페이지로 리다이렉트
		}


		// 판매자 ID 디버깅용
		System.out.println("상품 등록자 ID (seller_id): " + productDTO.getSeller_id());

		String yearPurchase = request.getParameter("year_purchase");
		if (yearPurchase != null && !yearPurchase.isEmpty()) {
			productDTO.setYear_purchase(Integer.parseInt(yearPurchase));
		}
		System.out.println("ProductController" + productDTO);
		productService.registerProduct(productDTO);

		return "redirect:/product/all";
	}

	@GetMapping("/detail")
	public String detail(HttpServletRequest request, Model model, HttpSession session) throws Exception {

		String product_id = request.getParameter("product_id");
		// product_id가 없거나 잘못된 경우에 대한 예외 처리
		if (product_id == null || product_id.isEmpty()) {
			throw new IllegalArgumentException("Invalid product_id");
		}

		// 현재 로그인한 사용자 확인
		String member_id = (String) session.getAttribute("member_id");
		if (member_id == null || member_id.isEmpty()) {
			throw new IllegalArgumentException("User must be logged in to perform this action.");
		}
		System.out.println("Product ID: " + product_id);
		System.out.println("Member ID: " + member_id);
		// 조회수 증가 처리
		productService.increseViewCount(Integer.parseInt(product_id));

		// 상품 상세 정보
		ProductDTO productDTO = productService.getProductDetail(product_id);

		// 판매자와 로그인 사용자 일치여부 확인, 수정 가능 여부 결정
		boolean canEdit = productDTO.getSeller_id().equals(member_id);

		// 찜 여부 확인을 위한 요청 데이터 생성
		Map<String, String> zzimRequest = new HashMap<>();
		zzimRequest.put("product_id", product_id);
		zzimRequest.put("member_id", member_id);

		System.out.println("ZzimRequest: " + zzimRequest);

		// 찜 여부 확인
		boolean isZzimSaved = zzimService.checkZzim(zzimRequest);
		System.out.println("Zzim Saved: " + isZzimSaved);

		// 모델에 필요한 정보 추가
		model.addAttribute("productDTO", productDTO);
		model.addAttribute("isZzimSaved", isZzimSaved);
		model.addAttribute("canEdit", canEdit);

		return "/product/detail";
	}

	@GetMapping("/update")
	public String update(@RequestParam("product_id") String product_id, Model model, HttpSession session)
			throws Exception {
		// 현재 로그인한 사용잫 확인
		String member_id = (String) session.getAttribute("member_id");

		// 상품 정보 조회
		ProductDTO productDTO = productService.getProductDetail(product_id);

		// 로그인한 사용자와 상품 등록자가 다를 경우 예외 처리
		if (!member_id.equals(productDTO.getSeller_id())) {
			throw new IllegalArgumentException("수정 권한이 없습니다.");
		}

		// 모델에 상품 정보를 추가하여 update.jsp로 전달
		model.addAttribute("productDTO", productDTO);

		return "product/update"; // update.jsp로 이동
	}

	@PostMapping("/updatePro")
	public String updateProductPro(ProductDTO productDTO, HttpSession session) throws Exception {
		// 로그인한 사용자 확인
		String member_id = (String) session.getAttribute("member_id");

		// 유효성 검사: 상품 정보 및 로그인 여부 확인
		if (productDTO == null || productDTO.getProduct_id() == 0 || member_id == null) {
			throw new IllegalArgumentException("유효하지 않은 요청입니다.");
		}

		// 데이터베이스에서 상품의 실제 등록자 ID(seller_id) 가져오기
		ProductDTO existingProduct = productService.getProductDetail(String.valueOf(productDTO.getProduct_id()));

		// 디버깅 코드 추가: 가져온 seller_id 확인
		System.out.println("DB에서 가져온 상품 등록자 ID: " + existingProduct.getSeller_id());

		// 로그인한 사용자와 상품 등록자 일치 여부 확인
		if (!member_id.equals(existingProduct.getSeller_id())) {
			throw new IllegalArgumentException("수정 권한이 없습니다.");
		}

		// 상품 정보 수정
		productService.updateProduct(productDTO);

		// 수정 후 상품의 상세 페이지로 리다이렉트
		return "redirect:/product/detail?product_id=" + productDTO.getProduct_id();
	}

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

}// ProductController()
