package com.itwillbs.domain;

import java.sql.Timestamp;

public class PurchaseRequestDTO {
	
	private int purchase_id;
	private String pc_item_name;
	private String member_id;
	private char expected_grade;
	private int expected_price;
	private String shipping_method;
	private String purchase_status;
	private String transfer_bank;
	private String transfer_account;
	private Timestamp request_date;
	
	private String bank_name;
	
	public int getPurchase_id() {
		return purchase_id;
	}
	public void setPurchase_id(int purchase_id) {
		this.purchase_id = purchase_id;
	}
	public String getPc_item_name() {
		return pc_item_name;
	}
	public void setPc_item_name(String pc_item_name) {
		this.pc_item_name = pc_item_name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public char getExpected_grade() {
		return expected_grade;
	}
	public void setExpected_grade(char expected_grade) {
		this.expected_grade = expected_grade;
	}
	public int getExpected_price() {
		return expected_price;
	}
	public void setExpected_price(int expected_price) {
		this.expected_price = expected_price;
	}
	public String getShipping_method() {
		return shipping_method;
	}
	public void setShipping_method(String shipping_method) {
		this.shipping_method = shipping_method;
	}
	public String getPurchase_status() {
		return purchase_status;
	}
	public void setPurchase_status(String purchase_status) {
		this.purchase_status = purchase_status;
	}
	public String getTransfer_bank() {
		return transfer_bank;
	}
	public void setTransfer_bank(String transfer_bank) {
		this.transfer_bank = transfer_bank;
	}
	public String getTransfer_account() {
		return transfer_account;
	}
	public void setTransfer_account(String transfer_account) {
		this.transfer_account = transfer_account;
	}
	public Timestamp getRequest_date() {
		return request_date;
	}
	public void setRequest_date(Timestamp request_date) {
		this.request_date = request_date;
	}	
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	
	@Override
	public String toString() {
		return "PurchaseRequestDTO [purchase_id=" + purchase_id + ", pc_item_name=" + pc_item_name + ", member_id="
				+ member_id + ", expected_grade=" + expected_grade + ", expected_price=" + expected_price
				+ ", shipping_method=" + shipping_method + ", purchase_status=" + purchase_status + ", transfer_bank="
				+ transfer_bank + ", transfer_account=" + transfer_account + ", request_date=" + request_date + "]";
	}
	
	
	
	
	
	

}
