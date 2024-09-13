package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class VerificationController {

    @GetMapping("/auth/verify")
    @ResponseBody
    public String verifyEmail(@RequestParam("token") String token) {
        // 실제로는 token을 데이터베이스와 비교하여 검증해야 합니다.
        return "Email verified successfully with token: " + token;
    }
}
