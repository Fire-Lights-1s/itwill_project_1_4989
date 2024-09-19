package com.itwillbs.domain;

import java.sql.Timestamp;

public class NoticeDTO {
	
	private int notice_id;
	private String notice_name;
	private String notice_cont;
	private Timestamp notice_date;
	
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_name() {
		return notice_name;
	}
	public void setNotice_name(String notice_name) {
		this.notice_name = notice_name;
	}
	public String getNotice_cont() {
		return notice_cont;
	}
	public void setNotice_cont(String notice_cont) {
		this.notice_cont = notice_cont;
	}
	public Timestamp getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Timestamp notice_date) {
		this.notice_date = notice_date;
	}
	
	
	@Override
	public String toString() {
		return "NoticeDTO [notice_id=" + notice_id + ", notice_name=" + notice_name + ", notice_cont=" + notice_cont
				+ ", notice_date=" + notice_date + "]";
	}
	
	
}
