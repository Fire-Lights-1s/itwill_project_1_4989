package com.itwillbs.domain;

import java.sql.Timestamp;

public class ChatMessageDTO {
	private String chat_id;
	private String chat_room_id;
	private String message_type; //MESSAGE - 메세지 or IMG - 이미지 주소 저장
	private String alarm;
	private String user_id;
	private String message;
	private Timestamp send_time;
	
	//기본생성자 생성하기
    public ChatMessageDTO(String roomId,
    		String sender, 
    		String message) {
        this.chat_room_id = roomId;
        this.user_id = sender;
        this.message = message;
        this.send_time = new Timestamp(System.currentTimeMillis());
    }
	
	public String getChat_id() {
		return chat_id;
	}
	public void setChat_id(String chat_id) {
		this.chat_id = chat_id;
	}
	public String getChat_room_id() {
		return chat_room_id;
	}
	public void setChat_room_id(String chat_room_id) {
		this.chat_room_id = chat_room_id;
	}
	public String getMessage_type() {
		return message_type;
	}
	public void setMessage_type(String message_type) {
		this.message_type = message_type;
	}
	public String getAlarm() {
		return alarm;
	}
	public void setAlarm(String alarm) {
		this.alarm = alarm;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Timestamp getSend_time() {
		return send_time;
	}
	public void setSend_time(Timestamp send_time) {
		this.send_time = send_time;
	}
	
	
}
