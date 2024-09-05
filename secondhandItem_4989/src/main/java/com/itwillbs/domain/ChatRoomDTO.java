package com.itwillbs.domain;

import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.WebSocketSession;

import com.itwillbs.service.ChatService;

public class ChatRoomDTO {
    private String chat_room_id;
    private int product_id;
    private String buyer_id;
    private String seller_id;
    private String title;
    
    public ChatRoomDTO create(int productId,
    		String buyerId,
     		String sellerId,
    		String roomTitle) {
		ChatRoomDTO chatRoom = new ChatRoomDTO();
		chatRoom.chat_room_id = productId + buyerId ;
		chatRoom.product_id = productId;
		chatRoom.buyer_id = buyerId;
		chatRoom.seller_id = sellerId;
    	chatRoom.title = roomTitle;
    	
    	return chatRoom;
    }
}