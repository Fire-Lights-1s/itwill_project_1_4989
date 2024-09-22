package com.itwillbs.domain;

import java.sql.Timestamp;

public class TXDTO {
	
	private int transaction_id;
	private int product_id;
	private String buyer_id;
	private Timestamp transaction_end_date;
	private String transaction_method;
	private boolean is_reserved;
	private Timestamp reservation_date;
	
	
	@Override
	public String toString() {
		return "TXDTO [transaction_id=" + transaction_id + ", product_id=" + product_id + ", buyer_id=" + buyer_id
				+ ", transaction_end_date=" + transaction_end_date + ", transaction_method=" + transaction_method
				+ ", is_reserved=" + is_reserved + ", reservation_date=" + reservation_date + "]";
	}
	
	public int getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(int transaction_id) {
		this.transaction_id = transaction_id;
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
	public Timestamp getTransaction_end_date() {
		return transaction_end_date;
	}
	public void setTransaction_end_date(Timestamp transaction_end_date) {
		this.transaction_end_date = transaction_end_date;
	}
	public String getTransaction_method() {
		return transaction_method;
	}
	public void setTransaction_method(String transaction_method) {
		this.transaction_method = transaction_method;
	}
	public boolean getIs_reserved() {
		return is_reserved;
	}
	public void setIs_reserved(boolean is_reserved) {
		this.is_reserved = is_reserved;
	}
	public Timestamp getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(Timestamp reservation_date) {
		this.reservation_date = reservation_date;
	}
	
	

}
