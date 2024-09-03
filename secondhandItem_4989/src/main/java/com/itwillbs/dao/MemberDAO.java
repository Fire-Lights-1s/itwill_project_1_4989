package com.itwillbs.dao;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.MemberMapper";
	
	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberDAO userCheck()");
		
		return sqlSession.selectOne(namespace + ".userCheck", memberDTO);
	}
	
	public void insertMember(MemberDTO memberDTO) {
		System.out.println("MemberDAO insertMember()");
		
		sqlSession.insert(namespace + ".insertMember", memberDTO);
	}
	
}
