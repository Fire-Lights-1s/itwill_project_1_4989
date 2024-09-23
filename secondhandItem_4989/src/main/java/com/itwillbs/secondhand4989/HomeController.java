package com.itwillbs.secondhand4989;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.ProductListService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Inject
	private ProductListService productListService;
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping("/")
	public String home(Model model, HttpServletRequest request, HttpSession session, MemberDTO memberDTO) {
		// 인기상품 목록 넘겨주기
		List<ProductDTO> popList = productListService.getPopList();
		model.addAttribute("popList", popList);
		
		// 등록 후 경과시간 계산해서 넘겨주기
		List<String> elapsedTimeList = productListService.getElapsedTimeList(popList);
		model.addAttribute("elapsedTimeList", elapsedTimeList);
	    
		// 쿠키에서 loginSessionId를 확인하여 자동 로그인 처리
        Cookie[] cookies = request.getCookies();
        System.out.println(cookies);
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("loginSessionId".equals(cookie.getName())) {
                	
                	String id = cookie.getValue();
                	
                	memberDTO.setMember_id(id);
                	
                	MemberDTO memberDTO2 = memberService.userCheck1(memberDTO);
            		System.out.println(memberDTO2);
            		if(memberDTO2 != null) {
            			
            			session.setAttribute("member_id", memberDTO2.getMember_id());
            			session.setAttribute("nickname", memberDTO2.getNickname());
            			// 쿠키에 저장된 세션 ID가 현재 세션과 일치할 경우 자동 로그인
                        return "index";
                        
            		}
                        
                    
                }
            }
        }
		
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
