package com.itwillbs.controller;

import java.io.File;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReportDTO;
import com.itwillbs.service.AdminService;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MyPageService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Inject
	private AdminService adminService;
	
	@Inject
	private MyPageService myPageService;
	
	@Inject
	private MemberService memberService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//admin이 아닐경우 admin페이지에 접근차단
	@GetMapping("/")
    public String main(HttpSession session, RedirectAttributes redirectAttributes, MemberDTO memberDTO, Model model) {
        String memberId = (String) session.getAttribute("member_id");
        
        // member_id가 admin이 아닌 경우 메인 페이지로 리다이렉트
        if (memberId == null || !memberId.equals("admin")) {
            redirectAttributes.addFlashAttribute("msg", "접근 권한이 없습니다.");
            return "redirect:/";  // 메인 페이지로 리다이렉트
        } else {
        	int memberCount = adminService.memberCount(memberDTO);
        	int productCount = adminService.productCount(memberDTO);
        	int purchaseCount = adminService.purchaseCount(memberDTO);
        	int reportCount = adminService.reportCount(memberDTO);
            
            model.addAttribute("memberCount", memberCount);
            model.addAttribute("productCount", productCount);
            model.addAttribute("purchaseCount", purchaseCount);
            model.addAttribute("reportCount", reportCount);
        	return "/admin/main";
        }
    }
	
	
//	@GetMapping("/")
//	public String main() {
//		return "/admin/sample";
//	}
	
	@GetMapping("/member")
	public String member(HttpServletRequest request, Model model) {
		PageDTO pageDTO = new PageDTO();
		String pageNum = request.getParameter("pageNum");
		String searchKey = request.getParameter("search");
		
		
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10;
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		int count = adminService.getMemberCount(pageDTO);
		
		if(searchKey != null && !searchKey.isEmpty()) {
			pageDTO.setSearch(searchKey);
		} 
		
		int pageBlock = 10;
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		
		List<MemberDTO> memberList = adminService.getMemberList(pageDTO);
		
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("memberList", memberList);
		
		
		
		return "/admin/member/list";
	}
	
	@GetMapping("/member/details")
	public String getMemberDetails(@RequestParam("member_id") String member_id, Model model) {
	    // member_id를 기반으로 회원 정보를 조회
	    MemberDTO memberDTO = memberService.getMember(member_id);
	    
	    // 회원 정보가 있는지 확인
	    if (memberDTO != null) {
	        model.addAttribute("member", memberDTO);
	        return "/admin/member/details"; // 회원 상세 정보를 보여줄 JSP 또는 HTML 페이지로 반환
	    }
	    
	    // 회원 정보가 없을 경우, 회원 목록 페이지로 리다이렉트
	    return "redirect:/admin/member";
	}
	
	@PostMapping("/member/detailsPro")
	public String detailsPro(HttpServletRequest request, MultipartFile file)throws Exception {
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
		return "redirect:/member/list";
	}
	
	/*
	 * @GetMapping("/trade") public String getTradeList(Model model) {
	 * List<Map<String, Object>> tradeList = adminService.getTradeList();
	 * System.out.println(tradeList); model.addAttribute("tradeList", tradeList);
	 * return "/admin/trade";
	 * 
	 * }
	 */
	
//	
//	@GetMapping("/purchase")
//	public String puchase() {
//		return "/admin/puchase/list";
//	}
//	
	@GetMapping("/pay")
	public String pay() {
		return "/admin/pay";
	}

	@GetMapping(value = "/report", produces = "application/text; charset=UTF-8")
	public String report(HttpServletRequest request, Model model) {
		PageDTO pageDTO = new PageDTO();
		String pageNum = request.getParameter("pageNum");
		
		System.out.println(request.getParameter("search"));
		if(request.getParameter("search") != null && request.getParameter("search") != "") {
			pageDTO.setSearch(request.getParameter("search"));
		}
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10;
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		int count = adminService.getReportCount(pageDTO);
		
		int pageBlock = 10;
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		
		List<ReportDTO> reportList = adminService.getReportList(pageDTO);
		
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("reportList", reportList);
		return "/admin/cs/report";
	}
	@PostMapping(value = "/report/update", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String reportUpdate(ReportDTO reportDTO) {
		String json = null;
		ReportDTO report = null;
		report = adminService.updateReport(reportDTO);
		
		try {
			json = new ObjectMapper().writeValueAsString(report);
			System.out.println("json productDTO"+json);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return json;
	}
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
