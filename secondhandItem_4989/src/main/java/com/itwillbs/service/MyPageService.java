package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MyPageDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.ZzimDTO;

@Service
public class MyPageService {
	
	@Inject
	private MyPageDAO myPageDAO;

	public List<ProductDTO> getProductList(PageDTO pageDTO) {
		System.out.println("MyPageService getProductList()");
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		return myPageDAO.getProductList(pageDTO);
	}
	
	public int getProductCount(PageDTO pageDTO) {
		System.out.println("MyPageService getProductCount()");
		return myPageDAO.getProductCount(pageDTO);
	}

	public List<ProductDTO> getZzimList(PageDTO pageDTO) {
		System.out.println("MyPageService getZzimList()");
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		return myPageDAO.getZzimList(pageDTO);
	}
	
	public int getZzimCount(PageDTO pageDTO) {
		System.out.println("MyPageService getZzimCount()");
		return myPageDAO.getZzimCount(pageDTO);
	}

	public void deleteZzim(ZzimDTO zzimDTO) {
		System.out.println("MyPageService deleteZzim()");
		myPageDAO.deleteZzim(zzimDTO);
	}
}
