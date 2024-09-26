package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ChatDAO;
import com.itwillbs.domain.ChatMessageDTO;
import com.itwillbs.domain.ChatRoomDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.TXDTO;

@Service
public class ChatService {

	@Inject
	ChatDAO chatDAO;

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
		TXDTO txDTO = new TXDTO();
		txDTO.setProduct_id(productDTO.getProduct_id());
		txDTO.setBuyer_id(productDTO.getBuyer_id());
		
		if(chatDAO.checkProductTX(productDTO) < 1) {
			productDTO.setTrade_status("예약 중");
			chatDAO.updateProductTradeStatus(productDTO);
			txDTO.setReservation_date(new Timestamp(System.currentTimeMillis()));
			chatDAO.createTX(txDTO);
		}else {
			if(productDTO.getTrade_status().equals("판매 예약 취소")) {
				// 기본 생성자로 생성되는 boolean 값은 false
				txDTO.setIs_reserved(true);
				chatDAO.updateTX(txDTO);
				productDTO.setTrade_status("거래 가능");
				chatDAO.updateProductTradeStatus(productDTO);
			}
			if(productDTO.getTrade_status().equals("구매 확정")) {
				txDTO.setTransaction_end_date(new Timestamp(System.currentTimeMillis()));
				txDTO.setTransaction_method(productDTO.getPay_method());
				chatDAO.updateTX(txDTO);
				productDTO.setTrade_status("거래 완료");
				chatDAO.updateProductTradeStatus(productDTO);
			}
		}
		return productDTO;
	}//updateProductTradeStatus

	public ChatMessageDTO createChatMessage(String roomId, ChatMessageDTO message) {
		message.setChat_room_id(roomId);
		message.setAlarm(true);
		message.setSend_time(new Timestamp(System.currentTimeMillis()));
		chatDAO.createChatMessage(message);
		return message;
	}

	public List<ChatMessageDTO> getChatMessageList(String chat_room_id) {
		List<ChatMessageDTO> chatList = null;
		chatList = chatDAO.getChatMessageList(chat_room_id);
		return chatList;
	}
}
