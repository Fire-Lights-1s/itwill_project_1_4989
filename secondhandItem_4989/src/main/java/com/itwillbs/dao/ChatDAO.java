package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ChatMessageDTO;
import com.itwillbs.domain.ChatRoomDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.TXDTO;

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
	public ProductDTO getProductInfo(int product_id) {
		ProductDTO productDTO = sqlSession.selectOne(namespace+".getProductInfo", product_id);
		return productDTO;
	}
	public List<ChatRoomDTO> getChatRoomList(String member_id) {
		List<ChatRoomDTO> chatRoomList = sqlSession.selectList(namespace+".getChatRoomList",member_id);
		return chatRoomList;
	}
	public ProductDTO updateProductTradeStatus(ProductDTO productDTO) {
		sqlSession.update(namespace+".updateProductTradeStatus", productDTO);
		return productDTO;
	}
	public int checkProductTX(ProductDTO productDTO) {
		int check = sqlSession.selectOne(namespace+".checkProductTX", productDTO);
		return check;
	}
	public void createTX(TXDTO txDTO) {
		sqlSession.insert(namespace+".createTX", txDTO);
	}
	public void updateTX(TXDTO txDTO) {
		sqlSession.update(namespace+".updateTX", txDTO);
	}
	public void createChatMessage(ChatMessageDTO message) {
		sqlSession.insert(namespace+".createChatMessage",message);
		
	}
	public List<ChatMessageDTO> getChatMessageList(String chat_room_id) {
		List<ChatMessageDTO> chatList = sqlSession.selectList(namespace+".getChatMessageList",chat_room_id);
		return chatList;
	}
	

}
