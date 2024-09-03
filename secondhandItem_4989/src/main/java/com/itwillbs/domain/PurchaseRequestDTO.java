package com.itwillbs.domain;

public class PurchaseRequestDTO {
	
	private int purchase_id;
	private int pc_item_id;
	private String member_id;
	private char expected_grade;
	private String purchse_status;
	private String transfer_bank;
	private String transfer_account;
	private String transfer_holder;
	
	
	public int getPurchase_id() {
		return purchase_id;
	}
	public void setPurchase_id(int purchase_id) {
		this.purchase_id = purchase_id;
	}
	public int getPc_item_id() {
		return pc_item_id;
	}
	public void setPc_item_id(int pc_item_id) {
		this.pc_item_id = pc_item_id;
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
	public String getPurchse_status() {
		return purchse_status;
	}
	public void setPurchse_status(String purchse_status) {
		this.purchse_status = purchse_status;
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
	public String getTransfer_holder() {
		return transfer_holder;
	}
	public void setTransfer_holder(String transfer_holder) {
		this.transfer_holder = transfer_holder;
	}
	@Override
	public String toString() {
		return "PurchaseRequestDTO [purchase_id=" + purchase_id + ", pc_item_id=" + pc_item_id + ", member_id="
				+ member_id + ", expected_grade=" + expected_grade + ", purchse_status=" + purchse_status
				+ ", transfer_bank=" + transfer_bank + ", transfer_account=" + transfer_account + ", transfer_holder="
				+ transfer_holder + "]";
	}
	
	
	

}
