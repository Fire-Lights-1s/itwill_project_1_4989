package com.itwillbs.service;

import java.sql.Timestamp;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;



@Service
public class MemberService {
	
	HttpSession session;
	
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

	public MemberDTO getMember(String id) {
		System.out.println("MemberService getMember()");
		return memberDAO.getMember(id);
	}

	public void updateMember(MemberDTO memberDTO) {
		System.out.println("MemberService updateMember()");
		memberDAO.updateMember(memberDTO);		
	}
	
	//소셜 로그인
	public MemberDTO SocialCheck(MemberDTO memberDTO) {
		System.out.println("MemberService SocialCheck()");
		
		return memberDAO.SocialCheck(memberDTO);
	}
	
	//소셜 회원가입
	public void insertSocial(MemberDTO memberDTO) {
		System.out.println("MemberService insertSocial()");
		
		
		
		memberDTO.setCreated_at(new Timestamp(System.currentTimeMillis()));
		
		memberDAO.insertSocial(memberDTO);
	}
	
	public MemberDTO idCheck(MemberDTO memberDTO) {
		System.out.println("MemberService idCheck()");
		
		return memberDAO.idCheck(memberDTO);
	}
	
}
