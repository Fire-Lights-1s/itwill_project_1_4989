package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.domain.ChatMessageDTO;
import com.itwillbs.domain.ChatRoomDTO;
import com.itwillbs.service.ChatService;

@Controller
public class ChatController {
	@Inject
	private ChatService chatService;
	
	@GetMapping("/chat")
	public String chat(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		if(session.getAttribute("member_id") != null) {
			return "/chat/chat";
		}
		return "/chat/chat";
	}
	
	@PostMapping("/chat/createRoom")
	public String createRoom(ChatRoomDTO chatRoomDTO, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("member_id") != null) {
			System.out.println(chatRoomDTO);
			List<ChatRoomDTO> chatRoomDTOList = null;
			chatService.createChatRoom(chatRoomDTO);
			model.addAttribute("chatRoomDTO", chatRoomDTO);
			model.addAttribute("chatRoomDTOList", chatRoomDTOList);
			return "redirect:/chat";
		}
		return "redirect:/chat";
	}
	// 이 주소로 요청이 오면 그 채팅방의 메세지 리스트를 돌려준다
	@MessageMapping("/{roomId}/reciveList")
	public List<ChatMessageDTO> chatMessageList(){
		
		return null;
	}
	
	@MessageMapping("/{roomId}")
	@SendTo("/topic/{roomId}")
    public ChatMessageDTO chat(@DestinationVariable("roomId") String roomId, 
    		ChatMessageDTO message){
		System.out.println(message);
		//클라이언트에서 받아야하는 DTO 변수 chat_room_id, message_type, user_id, message
		ChatMessageDTO chat = chatService.createChat(roomId ,message);
		return chat;
        //simpMessagingTemplate.convertAndSend("/topic/"+roomId,data);
    }
}


