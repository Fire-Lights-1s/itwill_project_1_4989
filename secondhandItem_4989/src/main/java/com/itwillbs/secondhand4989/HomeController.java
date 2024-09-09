package com.itwillbs.secondhand4989;


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

import com.google.protobuf.Duration;
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
		List<ProductDTO> popList = homeService.getPopList();
		model.addAttribute("popList", popList);
//		
//		// 등록 후 경과시간 계산, model에 담아서 넘겨주기]
//	    LocalDateTime now = LocalDateTime.now();
//	    
//	    // 경과 시간을 따로 계산하여 Model에 추가
//	    List<String> elapsedTimeList = new ArrayList<>();
//	    for (ProductDTO product : popList) {
//	        LocalDateTime registrationTime = product.getCreated_datetime(); // Datetime이 아니네....
//	        Duration duration = Duration.between(registrationTime, now);
//	        
//	        long hours = duration.toHours();
//	        long minutes = duration.toMinutes() % 60;
//	        String elapsedTime = hours + "시간 " + " 전";
//	        
//	        elapsedTimeList.add(elapsedTime);
//	    }
//		
	    
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
