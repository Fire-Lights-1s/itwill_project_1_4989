package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReportDTO;
import com.itwillbs.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Inject
	private AdminService adminService;
	
	//admin이 아닐경우 admin페이지에 접근차단
	@GetMapping("/")
    public String main(HttpSession session, RedirectAttributes redirectAttributes) {
        String memberId = (String) session.getAttribute("member_id");

        // member_id가 admin이 아닌 경우 메인 페이지로 리다이렉트
        if (memberId == null || !memberId.equals("admin")) {
            redirectAttributes.addFlashAttribute("msg", "접근 권한이 없습니다.");
            return "redirect:/";  // 메인 페이지로 리다이렉트
        }

        // member_id가 admin인 경우 admin 페이지로 이동
        return "/admin/main";
    }
	
	
//	@GetMapping("/")
//	public String main() {
//		return "/admin/sample";
//	}
	
//	@GetMapping("/member")
//	public String member() {
//		return "/admin/member/list";
//	}
//	
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
//	@GetMapping("/pay")
//	public String pay() {
//		return "/admin/pay/list";
//	}
//	
	@GetMapping("/report")
	public String report(HttpServletRequest request, Model model) {
		PageDTO pageDTO = new PageDTO();
		String pageNum = request.getParameter("pageNum");
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
