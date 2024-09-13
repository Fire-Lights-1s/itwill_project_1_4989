package com.itwillbs.controller;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.service.MailService;
import com.itwillbs.util.TokenGenerator;

@Controller
@RequestMapping("/member")
public class AuthController {

    @Autowired
    private MailService mailService;

    @PostMapping("/sendPro")
    public String sendVerificationEmail(@RequestParam String email, HttpSession session) {
        String token = TokenGenerator.generateToken();
//        String verificationLink = "http://localhost:8080/secondhand4989/auth/verify?token=" + token;

        String subject = "4989 이메일 인증";
        String body = "<p>4989 가입 인증 번호 : </p>"
                    + token;

        try {
            mailService.sendVerificationEmail(email, subject, body);
            session.setAttribute("token", token);
            return "redirect:/member/send";
        } catch (MessagingException e) {
            return "Error sending verification email";
        }
    }

}
