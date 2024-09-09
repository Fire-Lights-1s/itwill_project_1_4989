package com.itwillbs.service;

import java.sql.Timestamp;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.ChatMessageDTO;

@Service
public class ChatService {


	public ChatMessageDTO createChat(String roomId, ChatMessageDTO message) {
			message.setChat_room_id(roomId);
			message.setAlarm(true);
			message.setSend_time(new Timestamp(System.currentTimeMillis()));
		return message;
	}


}
