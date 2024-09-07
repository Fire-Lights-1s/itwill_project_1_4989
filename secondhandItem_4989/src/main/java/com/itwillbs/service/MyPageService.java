package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MyPageDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;

@Service
public class MyPageService {
	
	@Inject
	private MyPageDAO myPageDAO;

	public List<ProductDTO> getProductList(PageDTO pageDTO) {
		System.out.println("MyPageService getProductList()");
		return myPageDAO.getProductList(pageDTO);
	}

	public int getProductCount(MemberDTO memberDTO) {
		System.out.println("MyPageService getProductCount()");
		return myPageDAO.getProductCount(memberDTO);
	}

}
