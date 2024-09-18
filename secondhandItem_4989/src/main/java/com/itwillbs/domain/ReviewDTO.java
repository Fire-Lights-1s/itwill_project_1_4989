package com.itwillbs.domain;

import java.sql.Timestamp;

public class ReviewDTO {

	private int review_id;
	private int product_id;
	private int review_quality;
	private int review_price;
	private int review_time;
	private int review_manner;
	private String review_content;
	private Timestamp review_date;
	
	
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getReview_quality() {
		return review_quality;
	}
	public void setReview_quality(int review_quality) {
		this.review_quality = review_quality;
	}
	public int getReview_price() {
		return review_price;
	}
	public void setReview_price(int review_price) {
		this.review_price = review_price;
	}
	public int getReview_time() {
		return review_time;
	}
	public void setReview_time(int review_time) {
		this.review_time = review_time;
	}
	public int getReview_manner() {
		return review_manner;
	}
	public void setReview_manner(int review_manner) {
		this.review_manner = review_manner;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Timestamp getReview_date() {
		return review_date;
	}
	public void setReview_date(Timestamp review_date) {
		this.review_date = review_date;
	}
	
	
	
}
