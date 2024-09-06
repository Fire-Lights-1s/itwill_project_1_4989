package com.itwillbs.service;

import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

// 은행 계좌 - 예금주 조회 기능

@Service
public class AccountApiService {

	private final RestTemplate restTemplate;
	
	public AccountApiService(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}
		
	// 사용 인증키 받기
		public String getAccessToken(String apiKey, String apiSecret) {
			
			String url = "https://api.iamport.kr/users/getToken";	// 요청할 url
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);		// http 헤더에 콘텐츠 설정
			
			JSONObject requestBody = new JSONObject();				// http 바디에 담을 요청을 위한 json 객체 생성
			requestBody.put("imp_key", apiKey);
			requestBody.put("imp_secret", apiSecret);
			
			HttpEntity<String> entity = new HttpEntity<>(requestBody.toString(), headers);

			ResponseEntity<String> response = restTemplate.exchange(
				url, HttpMethod.POST, entity, String.class
			);
							
			if (response.getStatusCode().is2xxSuccessful()) { // 정상 처리(code: 200) 되면
				JSONObject responseBody = new JSONObject(response.getBody()); // json 객체에 응답 받기
				JSONObject responseObject = responseBody.getJSONObject("response"); // "response" 객체
				return responseObject.getString("access_token"); // 인증키 정보 반환
			} else {
				return null;
			}
		}
		
		
	// 예금주 조회
		public String getAccountHolder(String bank_code, String bank_num) {
			System.out.println("getAccountHolder까지 왔다!!!!!!!!!!!!!");
			String apiKey = "2632446146310815";
			String apiSecret = "ZspV4eZ5izjb1uWRc3oE2oq09H6cwFVXrHPqarlUwbqEyswTU6JOUBCuaYVIT2amp6YQ3Q7zF47Vt0eZ";
			String token = getAccessToken(apiKey, apiSecret);
			
			System.out.println("토큰확인 " + token);
			
			String url = UriComponentsBuilder.fromHttpUrl("https://api.iamport.kr/vbanks/holder")
				    .queryParam("bank_code", bank_code)
				    .queryParam("bank_num", bank_num)
				    .toUriString();
			
			System.out.println("이쪽으로 요청을 보냄 " + url);
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);		// http 헤더에 콘텐츠 설정
			headers.set("Authorization", "Bearer " + token);
			
			HttpEntity<Void> entity = new HttpEntity<>(headers);
			
			ResponseEntity<String> response = restTemplate.exchange(
				    url, HttpMethod.GET, entity, String.class
				);
			
			if (response.getStatusCode().is2xxSuccessful()) { // 정상 처리(code: 200) 되면
				JSONObject responseBody = new JSONObject(response.getBody()); // json 객체에 응답 받기
				System.out.println("응답확인 " + responseBody);
				JSONObject responseObject = responseBody.getJSONObject("response"); // "response" 객체
				return responseObject.getString("bank_holder"); // 인증키 정보 반환
			} else {
				return null;
			}
		}
	
}
