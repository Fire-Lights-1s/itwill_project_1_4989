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
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
//		               limit 시작하는 행번호 - 1, 글개수
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		return myPageDAO.getProductList(pageDTO);
	}

	public int getProductCount(ProductDTO productDTO) {
		System.out.println("MyPageService getProductCount()");
		return myPageDAO.getProductCount(productDTO);
	}

}
