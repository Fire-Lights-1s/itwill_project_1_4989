package com.itwillbs.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ChatDAO;
import com.itwillbs.domain.ChatMessageDTO;
import com.itwillbs.domain.ChatRoomDTO;

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
		if(checkChatRoomId(chatRoomDTO) < 1) {
			chatDAO.createChatRoom(chatRoomDTO);
		}
	}


}
