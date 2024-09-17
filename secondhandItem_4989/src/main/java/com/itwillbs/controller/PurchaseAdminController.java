package com.itwillbs.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PurchaseRequestDTO;
import com.itwillbs.service.PurchaseAdminService;
import com.itwillbs.service.PurchaseService;

@Controller
@RequestMapping("/admin")
public class PurchaseAdminController {

	@Inject
	private PurchaseService purchaseService;
	
	@Inject
	private PurchaseAdminService purchaseAdminService;

	@GetMapping("/purchase")
	public String purchaseAdmin(HttpServletRequest request, Model model) {
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
		List<PurchaseRequestDTO> purchaseList = purchaseAdminService.getPurchaseList(pageDTO);
		int count = purchaseAdminService.getPurchaseCount();
		
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
		model.addAttribute("purchaseList", purchaseList);
		
		return "/admin/purchase/list";
	}
	
	@GetMapping("/getPurchaseInfo")
	@ResponseBody
	public Map<String, Object> getPurchaseInfo(@RequestParam int purchase_id) {
		
		PurchaseRequestDTO purchaseDTO = purchaseService.getPurchDetail(purchase_id);

		Map<String, Object> purchaseInfo = new HashMap<>();
		purchaseInfo.put("purchase_id", purchaseDTO.getPurchase_id());
		purchaseInfo.put("member_id", purchaseDTO.getMember_id());
		
	    LocalDateTime localDateTime = purchaseDTO.getRequest_date().toLocalDateTime();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	    String formattedDate = localDateTime.format(formatter);
	    purchaseInfo.put("request_date", formattedDate);

		purchaseInfo.put("pc_item_name", purchaseDTO.getPc_item_name());
		purchaseInfo.put("expected_grade", purchaseDTO.getExpected_grade());
		purchaseInfo.put("expected_price", purchaseDTO.getExpected_price());
		String account_info = purchaseDTO.getBank_name() + " / " + purchaseDTO.getTransfer_account();
		purchaseInfo.put("account_info", account_info);
		
		System.out.println(purchaseDTO);
		
		return purchaseInfo;
	}
	
}
