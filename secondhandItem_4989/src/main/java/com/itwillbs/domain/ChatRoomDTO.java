package com.itwillbs.domain;


public class ChatRoomDTO {
    private String chat_room_id;
    private int product_id;
    private String buyer_id;
    private String seller_id;
    private String title;
    

	@Override
	public String toString() {
		return "{ "+
				"chat_room_id : " + chat_room_id +
				", product_id : " + product_id +
				", buyer_id : " + buyer_id +
				", seller_id : " + seller_id +
				", title : " + title +
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
    
}