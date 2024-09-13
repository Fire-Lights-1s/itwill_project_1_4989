package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
//	@Autowired
//	private MemberService memberService;
	
//	@GetMapping("/login")
//	public String login() {
//		return "/member/login";
//	} 
	
	@GetMapping("/login")
    public String loginPage(HttpServletRequest request, HttpSession session, MemberDTO memberDTO) {
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
                        return "redirect:/";
                        
            		}
                        
                    
                }
            }
        }
        // 로그인 페이지로 이동
        return "/member/login";
    }
	
	@GetMapping("/join")
	public String join() {
		return "/member/join";
	}
	
	@GetMapping("/social")
	public String social() {
		return "/member/social";
	}
	
	
	
//	//로그인 처리기능
//	@PostMapping("/loginPro")
//	public String loginPro(MemberDTO memberDTO,HttpSession session) {
//		
//		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
//		System.out.println(memberDTO2);
//		if(memberDTO2 != null) {
//			
//			session.setAttribute("member_id", memberDTO2.getMember_id());
//			session.setAttribute("nickname", memberDTO2.getNickname());
//			
//			return "redirect:/";
//		}else {
//			
//			return "redirect:/member/login";
//		}
//	}
	
	//로그인 처리기능
		@PostMapping("/loginPro")
		public String loginPro(MemberDTO memberDTO,
				HttpSession session,
				@RequestParam(value = "autoLogin", required = false) String autoLogin,
				HttpServletResponse response) {
			
			MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
			System.out.println(memberDTO2);
			if(memberDTO2 != null) {
				
				session.setAttribute("member_id", memberDTO2.getMember_id());
				session.setAttribute("nickname", memberDTO2.getNickname());
				
				String id = (String) session.getAttribute("member_id");
				
				// 자동 로그인이 체크된 경우
	            if (autoLogin != null) {
	                // 세션 아이디를 쿠키로 저장 (유효 기간 30일 설정)
	                Cookie loginCookie = new Cookie("loginSessionId", id);
	                loginCookie.setMaxAge(30 * 24 * 60 * 60); // 쿠키 유효 기간 30일 설정
	                loginCookie.setPath("/"); // 웹사이트 전체에서 쿠키가 유효
	                response.addCookie(loginCookie);
	                System.out.println(loginCookie);
	            }
	            
				
				return "redirect:/";
			}else {
				
				return "redirect:/member/login";
			}
		}

	
	@GetMapping("/welcome")
	public String welcome() {
		return "/member/welcome";
	}
	
	@GetMapping("/findid")
	public String findid() {
		return "/member/findid";
	}
	
	@GetMapping("/findpass")
	public String findpass() {
		return "/member/findpass";
	}
	
	//회원가입 처리기능
	@PostMapping("/joinPro")
	public String insertPro(MemberDTO memberDTO) {
		System.out.println("MemberController joinPro");
		System.out.println(memberDTO);
		
		memberService.insertMember(memberDTO);
		
		// 로그인 주소변경 이동
		return "redirect:/member/welcome";
	}
	
	//로그아웃 처리기능(세션값 제거)
//	@GetMapping("/logout")
//	public String logout(HttpSession session) {
//		System.out.println("MemberController logout");
//		session.invalidate();
//		return "redirect:/";
//	}
	
	@GetMapping("/logout")
    public String logout(HttpSession session, HttpServletResponse response) {
        // 세션 무효화
        session.invalidate();

        // 자동 로그인 쿠키 삭제
        Cookie loginCookie = new Cookie("loginSessionId", null);
        loginCookie.setMaxAge(0); // 쿠키를 삭제하는 방식으로 만료시킴
        loginCookie.setPath("/");
        response.addCookie(loginCookie);

        
        return "redirect:/";
    }
	
	@GetMapping("/naver")
	public String naver() {
		return "/member/naverlogin";
	}
	
	@GetMapping("/call")
	public String call() {
		return "/member/callback";
	}
	
	@GetMapping("/result")
	public String result() {
		return "/member/result";
	}
	
	@GetMapping("/result1")
	public String result1() {
		
		
		
		
		return "/member/result1";
	}
	
	@GetMapping("/asd")
	public String asd() {
		return "/member/asd";
	}
	
	
	@GetMapping("/callPro")
	public String callPro(MemberDTO memberDTO,HttpSession session) {
		
		String email = (String) session.getAttribute("email");
		
		memberDTO = new MemberDTO();
	    memberDTO.setEmail(email);
		
		MemberDTO memberDTO3 = memberService.SocialCheck(memberDTO);
		
		
		
		if(memberDTO3 != null) {
			session.setAttribute("member_id", memberDTO3.getMember_id());
			session.setAttribute("nickname", memberDTO3.getNickname());
			return "redirect:/";
		} else {
			System.out.println("memberDTO3 is null");
			return "redirect:/member/social";
		}
		
	}
	
	
	
	@PostMapping("/socialPro")
	public String socialPro(MemberDTO memberDTO, HttpSession session, HttpServletRequest request) {
		System.out.println("MemberController socialPro");
		System.out.println(memberDTO);
		session = request.getSession();
        String member_id = (String) session.getAttribute("member_id");
        String name = (String) session.getAttribute("name");
        String email = (String) session.getAttribute("email");

        // MemberDTO 객체 생성
        
        memberDTO.setMember_id(member_id);
        memberDTO.setName(name);
        memberDTO.setEmail(email);
		
		
		memberService.insertSocial(memberDTO);
		System.out.println(memberDTO);
		
		session.setAttribute("member_id", memberDTO.getMember_id());
		session.setAttribute("nickname", memberDTO.getNickname());
		
		// 로그인 주소변경 이동
		return "redirect:/";
	}
	
	@GetMapping("/resultid")
	public String resultid() {
		return "/member/resultid";
	}
	
	@PostMapping("/findidPro")
	public String findidPro(MemberDTO memberDTO,HttpSession session) {
		
		MemberDTO memberDTO2 = memberService.idCheck(memberDTO);
		System.out.println(memberDTO2);
	
		
		 if (memberDTO2 != null) {
			        
			        session.setAttribute("member_id", memberDTO2.getMember_id());
			        System.out.println(session.getAttribute("member_id"));
			        
			        return "redirect:/member/resultid"; // 반드시 반환
			    } else {
			        return "redirect:/member/findid"; // 반드시 반환
			    }
	}
	
	@GetMapping("/resultpass")
	public String resultpass() {
		return "/member/resultpass";
	}
	
	@PostMapping("/findpassPro")
	public String findpassPro(MemberDTO memberDTO,HttpSession session) {
		
		MemberDTO memberDTO2 = memberService.passCheck(memberDTO);
		System.out.println(memberDTO2);
	
		
		 if (memberDTO2 != null) {
			        
			        session.setAttribute("pass", memberDTO2.getPass());
			        System.out.println(session.getAttribute("pass"));
			        
			        return "redirect:/member/resultpass"; // 반드시 반환
			    } else {
			        return "redirect:/member/findpass"; // 반드시 반환
			    }
	}
	
	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		System.out.println("AjaxController idCheck()");
		String member_id = request.getParameter("id");
		
		MemberDTO memberDTO = memberService.getMember(member_id);
		
		String result = "";
		if(memberDTO != null) {
			//아이디 없음, 아이디 사용가능
			//result = "아이디 중복";
			result = "iddup";
		} else {
			//아이디 없음, 아이디 사용가능
			//result = "아이디 사용가능";
			result = "idok";
		}
		//결과값(html, xml, json) 리턴
		return result;
	}
	
	@GetMapping("/nickCheck")
	@ResponseBody
	public String nickCheck(HttpServletRequest request) {
		System.out.println("AjaxController nickCheck()");
		String nickname = request.getParameter("nickname");
		
		MemberDTO memberDTO = memberService.nickCheck(nickname);
		
		String result = "";
		if(memberDTO != null) {
			//아이디 없음, 아이디 사용가능
			//result = "아이디 중복";
			result = "nickdup";
		} else {
			//아이디 없음, 아이디 사용가능
			//result = "아이디 사용가능";
			result = "nickok";
		}
		//결과값(html, xml, json) 리턴
		return result;
	}
	
}
