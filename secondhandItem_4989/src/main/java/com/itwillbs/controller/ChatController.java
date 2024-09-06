package com.itwillbs.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.domain.ChatMessageDTO;
import com.itwillbs.service.ChatService;

@Controller
public class ChatController {
	@Inject
	private ChatService chatService;
	
	@Autowired
	private final SimpMessagingTemplate simpMessagingTemplate = null;
	
	@GetMapping("/chat")
	public String chat(HttpServletRequest request, Model model) {
		
		return "/chat/chat";
	}
	@MessageMapping("/{roomId}")
	@SendTo("/topic/{roomId}")
    public ChatMessageDTO chat(@DestinationVariable("roomId") String roomId, 
    		ChatMessageDTO message){
		System.out.println(message);
		//클라이언트에서 받아야하는 DTO 변수 chat_room_id, message_type, user_id, message
		ChatMessageDTO chat = chatService.createChat(roomId ,message);
		return message;
        //simpMessagingTemplate.convertAndSend("/topic/"+roomId,data);
    }
}


