package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.HomeDAO;
import com.itwillbs.domain.ProductDTO;

@Service
public class HomeService {

	@Inject
	private HomeDAO homeDAO;
	
	public List<ProductDTO> getPopList() {
		return homeDAO.getPopList();
	}
}
