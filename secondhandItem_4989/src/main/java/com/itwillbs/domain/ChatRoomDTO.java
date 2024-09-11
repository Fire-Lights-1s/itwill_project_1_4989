package com.itwillbs.domain;

import java.sql.Timestamp;

public class ChatRoomDTO {
    private String chat_room_id;
    private int product_id;
    private String buyer_id;
    private String seller_id;
    private String title;
    
    private String product_img1;
    private String message;
    private Timestamp send_time;
    

	@Override
	public String toString() {
		return "{ "+
				"\"chat_room_id\" : \"" + chat_room_id +
				"\", \"product_id\" : " + product_id +
				", \"buyer_id\" : \"" + buyer_id +
				"\", \"seller_id\" : \"" + seller_id +
				"\", \"title\" : \"" + title +
				"\", \"product_img1\" : \"" + product_img1 +
				"\", \"product_img1\" : \"" + message +
				"\", \"product_img1\" : " + send_time +
				"}";
	}

	public String getChat_room_id() {
		return chat_room_id;
	}

	public void setChat_room_id(String chat_room_id) {
		this.chat_room_id = chat_room_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getBuyer_id() {
		return buyer_id;
	}

	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getProduct_img1() {
		return product_img1;
	}

	public void setProduct_img1(String product_img1) {
		this.product_img1 = product_img1;
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