package com.itwillbs.secondhand4989;


import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.HomeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private HomeService homeService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping("/")
	public String home(Model model) {
		// 인기상품 목록 넘겨주기
		List<ProductDTO> popList = homeService.getPopList();
		model.addAttribute("popList", popList);
		
		// 등록 후 경과시간 계산해서 넘겨주기
	    LocalDateTime now = LocalDateTime.now();
	    List<String> elapsedTimeList = new ArrayList<>();
	    for (ProductDTO product : popList) {
	        LocalDateTime createdTime = product.getCreated_datetime().toLocalDateTime();
	        Duration duration = Duration.between(createdTime, now);
	        
	        String elapsedTime = new String();
	        long days = duration.toDays();
	        if (days >= 1) {
	        	elapsedTime = days + "일 전";
	        } else {
	        	long hours = duration.toHours();
	        	if (hours >= 1) {
	        		elapsedTime = hours + "시간 전";
	        		} else {
	        			long minutes = duration.toMinutes() % 60;
	        			elapsedTime = minutes + "분 전";
	        		}
	        }
	        elapsedTimeList.add(elapsedTime);
	    }
		model.addAttribute("elapsedTimeList", elapsedTimeList);
	    
		return "index";
	}
	
	
	@RequestMapping("/sample1")
	public String sample1() {
		return "sample_content";
	}
	
	@RequestMapping("/sample2")
	public String sample2() {
		return "sample_side_content";
	}
	
	
	
}
