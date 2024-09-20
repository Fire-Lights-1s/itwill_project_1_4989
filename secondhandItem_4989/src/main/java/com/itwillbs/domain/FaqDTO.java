package com.itwillbs.domain;

public class FaqDTO {

	private int faq_id;
	private String faq_quest;
	private String faq_answer;
	
	public int getFaq_id() {
		return faq_id;
	}
	public void setFaq_id(int faq_id) {
		this.faq_id = faq_id;
	}
	public String getFaq_quest() {
		return faq_quest;
	}
	public void setFaq_quest(String faq_quest) {
		this.faq_quest = faq_quest;
	}
	public String getFaq_answer() {
		return faq_answer;
	}
	public void setFaq_answer(String faq_answer) {
		this.faq_answer = faq_answer;
	}
	
	
	@Override
	public String toString() {
		return "FaqDTO [faq_id=" + faq_id + ", faq_quest=" + faq_quest + ", faq_answer=" + faq_answer + "]";
	}
	
}
