package com.itwillbs.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ZzimDAO;

@Service
public class ZzimService {

	@Inject
	private ZzimDAO zzimDAO;
	
	public boolean checkZzim(Map<String, String> request) {
		return zzimDAO.checkZzim(request);
	}
	
	public void saveZzim(Map<String, String> request) {
		zzimDAO.saveZzim(request);
	}

	public void deleteZzim(Map<String, String> request) {
		zzimDAO.deleteZzim(request);
	}
	
	
}
