package com.itwillbs.domain;

import java.sql.Timestamp;

public class ChatMessageDTO {
	private String chat_id;
	private String chat_room_id;
	private String message_type; //MESSAGE - 메세지 or IMG - 이미지 주소 저장
	private boolean alarm;
	private String user_id;
	private String message;
	private Timestamp send_time;
	
	//기본생성자 생성하기
	public ChatMessageDTO() {}
	
    public ChatMessageDTO(String chat_room_id,
    		String user_id, 
    		String message) {
        this.chat_room_id = chat_room_id;
        this.alarm = true;
        this.user_id = user_id;
        this.message = message;
        this.send_time = new Timestamp(System.currentTimeMillis());
    }
	
	@Override
	public String toString() {
		return "ChatMessageDTO[user_id = "+user_id+", message = "+message+"]";
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
	public boolean getAlarm() {
		return alarm;
	}
	public void setAlarm(boolean alarm) {
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
