package com.itwillbs.controller;
import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MailService;
import com.itwillbs.service.MemberService;
import com.itwillbs.util.TokenGenerator;

@Controller
@RequestMapping("/member")
public class AuthController {
	
	@Inject
	private MemberService memberService;
	
    @Autowired
    private MailService mailService;

    @PostMapping("/sendPro")
    public String sendVerificationEmail(@RequestParam String email, HttpSession session,
    		HttpServletRequest request, MemberDTO memberDTO, Model model, @RequestParam("pass") String password) {
        
    	String passwordPattern = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[!@#%^&*()_+=?])[A-Za-z\\d@$!#%^&*()_+=?]{8,}$";
		
    	if (password.matches(passwordPattern)) {
			int memberDTOCount = memberService.userCheck2(memberDTO);
			System.out.println(memberDTOCount);
//		입력정보 중복 확인
		if(memberDTOCount == 0) {
    	String token = TokenGenerator.generateToken();
//        String verificationLink = "http://localhost:8080/secondhand4989/auth/verify?token=" + token;

        String subject = "4989 이메일 인증";
        String body = "<p>4989 가입 인증 번호 : </p>"
                    + token;
        session.setAttribute("id", request.getParameter("member_id"));
        session.setAttribute("pass", request.getParameter("pass"));
        session.setAttribute("nick", request.getParameter("nickname"));
        session.setAttribute("name", request.getParameter("name"));
        session.setAttribute("phone", request.getParameter("phone"));
        session.setAttribute("email", request.getParameter("email"));

        try {
            mailService.sendVerificationEmail(email, subject, body);
            session.setAttribute("token", token);
            return "redirect:/member/send";
        } catch (MessagingException e) {
            return "redirect:/member/join";
        }
		} else {
			model.addAttribute("alertMessage", "이미 등록된 정보입니다.다시 확인해주세요.");
			return "member/join";
		} 
		} else {
			model.addAttribute("alertMessage", "비밀번호는 영문,숫자,특수문자를 포함하여 8자리 이상이어야 합니다.");
            return "member/join"; // 비밀번호가 8자리 미만이면 회원가입 페이지로 리다이렉트
		}
    }

}
