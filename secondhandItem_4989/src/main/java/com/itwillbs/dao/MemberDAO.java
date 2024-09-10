package com.itwillbs.dao;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;

@Repository
public class MemberDAO {
	
	HttpSession session;
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.MemberMapper";
	
	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberDAO userCheck()");
		
		return sqlSession.selectOne(namespace + ".userCheck", memberDTO);
	}
	
	public MemberDTO userCheck1(MemberDTO memberDTO) {
		System.out.println("MemberDAO userCheck1()");
		
		return sqlSession.selectOne(namespace + ".userCheck1", memberDTO);
	}
	
	public void insertMember(MemberDTO memberDTO) {
		System.out.println("MemberDAO insertMember()");
		
		sqlSession.insert(namespace + ".insertMember", memberDTO);
	}

	public MemberDTO getMember(String id) {
		System.out.println("MemberDAO getMember()");
		return sqlSession.selectOne(namespace + ".getMember", id);
	}

	public void updateMember(MemberDTO memberDTO) {
		System.out.println("MemberDAO updateMember()");
		sqlSession.update(namespace + ".updateMember", memberDTO);
	}
	
	public MemberDTO SocialCheck(MemberDTO memberDTO) {
		System.out.println("MemberDAO SocialCheck()");
		
		return sqlSession.selectOne(namespace + ".SocialCheck", memberDTO);
	}
	
	public void insertSocial(MemberDTO memberDTO) {
		System.out.println("MemberDAO insertSocial()");
		
		
		sqlSession.insert(namespace + ".insertSocial", memberDTO);
	}
	
	public MemberDTO idCheck(MemberDTO memberDTO) {
		System.out.println("MemberDAO idCheck()");
		
		return sqlSession.selectOne(namespace + ".idCheck", memberDTO);
	}
	
	public MemberDTO passCheck(MemberDTO memberDTO) {
		System.out.println("MemberDAO passCheck()");
		
		return sqlSession.selectOne(namespace + ".passCheck", memberDTO);
	}
	
}
