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
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		return myPageDAO.getProductList(pageDTO);
	}
	
	public int getProductCount(PageDTO pageDTO) {
		return myPageDAO.getProductCount(pageDTO);
	}

	public List<ProductDTO> getZzimList(PageDTO pageDTO) {
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		return myPageDAO.getZzimList(pageDTO);
	}
	
	public int getZzimCount(PageDTO pageDTO) {
		return myPageDAO.getZzimCount(pageDTO);
	}

	public void deleteZzim(ZzimDTO zzimDTO) {
		myPageDAO.deleteZzim(zzimDTO);
	}

	public List<ProductDTO> getBuyList(PageDTO pageDTO) {
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		return myPageDAO.getBuyList(pageDTO);
	}

	public int getBuyCount(PageDTO pageDTO) {
		return myPageDAO.getBuyCount(pageDTO);
	}

	public void deleteMem(String member_id) {
		myPageDAO.deleteMem(member_id);
	}

	public int allTX(String id) {
		return myPageDAO.allTX(id);
	}

	public void deleteSell(ProductDTO productDTO) {
		myPageDAO.deleteSell(productDTO);
	}

	public void updateReserv(ProductDTO productDTO) {
		myPageDAO.updateReserv(productDTO);
	}
}
