package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ChatDAO;
import com.itwillbs.domain.ChatMessageDTO;
import com.itwillbs.domain.ChatRoomDTO;
import com.itwillbs.domain.ProductDTO;

@Service
public class ChatService {

	@Inject
	ChatDAO chatDAO;

	public ChatMessageDTO createChat(String roomId, ChatMessageDTO message) {
			message.setChat_room_id(roomId);
			message.setAlarm(true);
			message.setSend_time(new Timestamp(System.currentTimeMillis()));
		return message;
	}
	public int checkChatRoomId(ChatRoomDTO chatRoomDTO){
		int check = chatDAO.checkChatRoomId(chatRoomDTO);
		return check;
	}
	public void createChatRoom(ChatRoomDTO chatRoomDTO) {
		chatRoomDTO.setChat_room_id(chatRoomDTO.getProduct_id() + chatRoomDTO.getBuyer_id());
		System.out.println(checkChatRoomId(chatRoomDTO));
		if(checkChatRoomId(chatRoomDTO) < 1) {
			chatDAO.createChatRoom(chatRoomDTO);
		}
	}
	public ProductDTO getProductInfo(int product_id) {
		ProductDTO productDTO = null;
		productDTO = chatDAO.getProductInfo(product_id);
		return productDTO;
	}
	public List<ChatRoomDTO> getChatRoomList(String member_id) {
		List<ChatRoomDTO> chatRoomList = null;
		chatRoomList = chatDAO.getChatRoomList(member_id);
		return chatRoomList;
	}
	public ProductDTO updateProductTradeStatus(ProductDTO productDTO) {
		chatDAO.updateProductTradeStatus(productDTO);
		if(chatDAO.checkProductTX(productDTO) < 1) {
			chatDAO.createTX(productDTO);
		}else {
			chatDAO.updateTX(productDTO);
		}
		return productDTO;
	}


}
