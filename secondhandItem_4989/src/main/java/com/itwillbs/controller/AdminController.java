package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
//	@GetMapping("/trade")
//	public String trade() {
//		return "/admin/trade";
//	}
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
		List<ReportDTO> reportList = adminService.getReportList(pageDTO);
		int count = adminService.getReportCount(pageDTO);
		
		int pageBlock = 10;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if(startPage < 1) {
			startPage = 1;
		}
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("reportList", reportList);
		
		return "/admin/cs/report";
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
