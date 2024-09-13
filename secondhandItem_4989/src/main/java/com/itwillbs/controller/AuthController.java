package com.itwillbs.controller;
import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.service.MailService;
import com.itwillbs.util.TokenGenerator;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private MailService mailService;

    @PostMapping("/send")
    @ResponseBody
    public String sendVerificationEmail(@RequestParam String email) {
        String token = TokenGenerator.generateToken();
//        String verificationLink = "http://localhost:8080/secondhand4989/auth/verify?token=" + token;

        String subject = "4989 이메일 인증";
        String body = "<p>Click the link below to verify your email:</p>"
                    + token;

        try {
            mailService.sendVerificationEmail(email, subject, body);
            return "Verification email sent to " + email;
        } catch (MessagingException e) {
            return "Error sending verification email";
        }
    }

}
