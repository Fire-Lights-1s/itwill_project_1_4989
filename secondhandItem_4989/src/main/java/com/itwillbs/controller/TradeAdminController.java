package com.itwillbs.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.TradeAdminService;



@Controller
@RequestMapping("/admin")
public class TradeAdminController {
	@Inject
	private TradeAdminService tradeAdminService;
	
	@GetMapping("/trade")
	public String tradeAdmin(HttpServletRequest request,Model model) {
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
		
		if(searchKey != null && !searchKey.isEmpty()) {
			pageDTO.setSearch(searchKey);
		} 
	
        List<ProductDTO> tradeList = tradeAdminService.getTradeList(pageDTO);
        int count = tradeAdminService.getTradeCount(pageDTO);

        // 페이지네이션 처리
        int pageBlock = 10;
        int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
        int endPage = startPage + pageBlock - 1;
        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
        if (startPage < 1) {
            startPage = 1;
        }
        if (endPage > pageCount) {
            endPage = pageCount;
        }
        pageDTO.setCount(count);
        pageDTO.setPageBlock(pageBlock);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);
        pageDTO.setPageCount(pageCount);

        // 모델에 추가하여 JSP로 전달
        model.addAttribute("pageDTO", pageDTO);
        model.addAttribute("tradeList", tradeList);

        return "/admin/trade/list"; 
    }

    // 거래 상세 정보를 가져오는 메서드 (AJAX 응답용)
    @GetMapping("/getTradeInfo")
    @ResponseBody
    public Map<String, Object> getTradeInfo(@RequestParam int product_id) {
    	// ProductDTO를 사용하여 거래 상세 정보 가져오기
    	 ProductDTO productDTO = tradeAdminService.getTradeDetail(product_id);

         Map<String, Object> tradeInfo = new HashMap<>();
         tradeInfo.put("product_id", productDTO.getProduct_id());
         tradeInfo.put("seller_id", productDTO.getSeller_id());
         tradeInfo.put("buyer_id", productDTO.getBuyer_id());
         tradeInfo.put("product_name", productDTO.getProduct_name());
         tradeInfo.put("created_datetime", productDTO.getCreated_datetime().toString());
         tradeInfo.put("transaction_end_date", productDTO.getTransaction_end_date().toString());
         tradeInfo.put("trade_status", productDTO.getTrade_status());

        return tradeInfo; // AJAX 요청에 대한 응답
    }
    @PostMapping("/saveTradeInfo")
    @ResponseBody
    public String saveTradeInfo(@RequestBody Map<String, Object> saveData) {
    	tradeAdminService.saveTradeInfo(saveData);
    	return "success";
    	
    }
    
}
	
	

	
