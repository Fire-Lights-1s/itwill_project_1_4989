package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ChatRoomDTO;
import com.itwillbs.domain.ProductDTO;

@Repository
public class ChatDAO {

	@Inject
	SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.ChatMapper";
	
	public int checkChatRoomId(ChatRoomDTO chatRoomDTO) {
		System.out.println(chatRoomDTO);
		int check = sqlSession.selectOne(namespace+".checkRoomId", chatRoomDTO);
		return check;
		
	}
	public void createChatRoom(ChatRoomDTO chatRoomDTO) {
		sqlSession.insert(namespace+".createRoom", chatRoomDTO);
	}
	public ProductDTO getProductInfo(ChatRoomDTO chatRoomDTO) {
		ProductDTO productDTO = sqlSession.selectOne(namespace+".getProductInfo", chatRoomDTO);
		return productDTO;
	}


}
