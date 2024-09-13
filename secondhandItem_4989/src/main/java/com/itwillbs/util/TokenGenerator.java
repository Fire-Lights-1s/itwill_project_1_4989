package com.itwillbs.util;
import java.util.Random;

public class TokenGenerator {
    public static String generateToken() {
    	 Random random = new Random();
         int randomNumber = 100000 + random.nextInt(900000); // 100000부터 999999 사이의 숫자를 생성
         return String.valueOf(randomNumber);
    }
}
