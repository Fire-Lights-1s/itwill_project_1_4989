package com.itwillbs.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.service.ZzimService;

@Controller
@RequestMapping("/zzim")
public class ZzimController {

	@Inject
	private ZzimService zzimService;

	@PostMapping("/save")		// 찜 저장 및 삭제
	public ResponseEntity<Map<String, Boolean>> saveZzim(@RequestBody Map<String, String> request) {

		Map<String, Boolean> response = new HashMap<>();

		try {
			
			if (zzimService.checkZzim(request)) {			// 이미 해당 사용자가 해당 상품을 찜한 경우
				System.out.println("if문 안으로 들어옴");
				zzimService.deleteZzim(request);	// 찜 테이블에서 삭제
		        response.put("save", false);		// 삭제됐음을 프론트로 넘겨줌
			} else {							// 해당 사용자가 해당 상품을 처음 찜한 경우
				zzimService.saveZzim(request);	// 찜 테이블에 추가	
		        response.put("save", true);		// 추가됐음을 프론트로 넘겨줌
			}
			
		} catch (Exception e) {					// request에 유효하지 않은 값 들어왔을 때 예외처리
	        response.put("error", true);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
	    }
		
        return ResponseEntity.ok(response);
	
		}
	
	@PostMapping("/status")
	public ResponseEntity<Map<String, Object>> getZzimStatus(@RequestBody Map<String, Object> request) {
	    String member_id = (String) request.get("member_id");
	    List<String> product_ids = (List<String>) request.get("product_ids");
	    
	    // 각 게시물의 찜 상태 확인
	    List<Map<String, Object>> zzimList = new ArrayList<>();
	    for (String product_id : product_ids) {
	        Map<String, Object> zzimStatus = new HashMap<>();
	        zzimStatus.put("product_id", product_id);
	        zzimStatus.put("isZzimSaved", zzimService.checkZzim(Map.of("product_id", product_id, "member_id", member_id)));
	        zzimList.add(zzimStatus);
	    }
	    
	    Map<String, Object> response = new HashMap<>();
	    response.put("zzimList", zzimList);
	    
	    return ResponseEntity.ok(response);
	}
	
}
