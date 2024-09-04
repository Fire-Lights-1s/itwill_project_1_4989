package com.itwillbs.secondhand4989;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {		
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
