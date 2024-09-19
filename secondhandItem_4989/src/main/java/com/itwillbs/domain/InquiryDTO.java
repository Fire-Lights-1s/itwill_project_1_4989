package com.itwillbs.domain;

import java.sql.Timestamp;

public class InquiryDTO {

	private int inquiry_id;
	private String member_id;
	private String inquiry_title;
	private String inquiry_contents;
	private String inquiry_reply;
	private Timestamp inquiried_at;
	private Timestamp replied_at;
	
	public int getInquiry_id() {
		return inquiry_id;
	}
	public void setInquiry_id(int inquiry_id) {
		this.inquiry_id = inquiry_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getInquiry_title() {
		return inquiry_title;
	}
	public void setInquiry_title(String inquiry_title) {
		this.inquiry_title = inquiry_title;
	}
	public String getInquiry_contents() {
		return inquiry_contents;
	}
	public void setInquiry_contents(String inquiry_contents) {
		this.inquiry_contents = inquiry_contents;
	}
	public String getInquiry_reply() {
		return inquiry_reply;
	}
	public void setInquiry_reply(String inquiry_reply) {
		this.inquiry_reply = inquiry_reply;
	}
	public Timestamp getInquiried_at() {
		return inquiried_at;
	}
	public void setInquiried_at(Timestamp inquiried_at) {
		this.inquiried_at = inquiried_at;
	}
	public Timestamp getReplied_at() {
		return replied_at;
	}
	public void setReplied_at(Timestamp replied_at) {
		this.replied_at = replied_at;
	}
	
	@Override
	public String toString() {
		return "InquiryDTO [inquiry_id=" + inquiry_id + ", member_id=" + member_id + ", inquiry_title=" + inquiry_title
				+ ", inquiry_contents=" + inquiry_contents + ", inquiry_reply=" + inquiry_reply + ", inquiried_at="
				+ inquiried_at + ", replied_at=" + replied_at + "]";
	}
	
	
	
	
	
}
