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
    public void sendMsg(@DestinationVariable("roomId") String roomId, @Payload Map<String,Object> data){
		System.out.println(data);
        simpMessagingTemplate.convertAndSend("/topic/"+roomId,data);
    }
//	@MessageMapping("/{roomId}") //여기로 전송되면 메서드 호출 -> WebSocketConfig prefixes 에서 적용한건 앞에 생략
//    @SendTo("/topic/{roomId}")   //구독하고 있는 장소로 메시지 전송 (목적지)  -> WebSocketConfig Broker 에서 적용한건 앞에 붙어줘야됨
//    public ChatMessageDTO chat(@DestinationVariable("roomId") String roomId, ChatMessageDTO message) {
//
//        //채팅 저장
//		ChatMessageDTO chat = chatService.createChat(roomId ,message);
//        return chat;
//    }
}


