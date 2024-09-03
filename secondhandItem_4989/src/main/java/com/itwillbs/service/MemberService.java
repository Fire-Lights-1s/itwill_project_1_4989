package com.itwillbs.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;



@Service
public class MemberService {
	
	@Inject
	private MemberDAO memberDAO;
	
	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberService userCheck()");
		
		return memberDAO.userCheck(memberDTO);
	}
	
	public void insertMember(MemberDTO memberDTO) {
		System.out.println("MemberService insertMember()");
		
		memberDTO.setCreated_at(new Timestamp(System.currentTimeMillis()));
		
		memberDAO.insertMember(memberDTO);
	}
	
	
}
