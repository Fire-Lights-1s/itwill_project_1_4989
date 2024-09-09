package com.itwillbs.controller;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;


public class ApiExamMemberProfile {
	
	
	public static Map<String, Object> getUserProfile(String token) {
        String header = "Bearer " + token; // Bearer 다음에 공백 추가
        String apiURL = "https://openapi.naver.com/v1/nid/me";

        // Authorization 헤더 설정
        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("Authorization", header);

        // API 호출 및 결과 반환
        String responseBody = get(apiURL, requestHeaders);

        // JSON 파싱하여 Map으로 변환
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            Map<String, Object> resultMap = objectMapper.readValue(responseBody, Map.class);
            
            // 결과 출력 (예시로 resultcode와 response 내부를 출력)
            System.out.println("Result Code: " + resultMap.get("resultcode"));
            System.out.println("Message: " + resultMap.get("message"));

            // response 내부는 다시 Map으로 캐스팅하여 접근
            Map<String, Object> response = (Map<String, Object>) resultMap.get("response");
            
          

            return response; // 필요시 원본 JSON을 반환
        } catch (IOException e) {
            throw new RuntimeException("JSON 파싱 실패", e);
        }
    }

    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }


    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
    
    
    
    public static String getAccessToken(String jsonResponse) {
        try {
            // ObjectMapper 인스턴스를 생성하여 JSON 문자열을 Map으로 파싱
            ObjectMapper objectMapper = new ObjectMapper();
            Map<String, Object> resultMap = objectMapper.readValue(jsonResponse, Map.class);
            
            // access_token 값 추출
            return (String) resultMap.get("access_token");
        } catch (IOException e) {
            throw new RuntimeException("JSON 파싱 실패", e);
        }
    }
}
