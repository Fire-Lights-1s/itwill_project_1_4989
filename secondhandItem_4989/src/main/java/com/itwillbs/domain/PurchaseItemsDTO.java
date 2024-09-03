package com.itwillbs.domain;

public class PurchaseItemsDTO {
	
	private int pc_item_id;
	private int category_id;
	private String pc_item_name;
	private int price_s;
	private int price_a;
	private int price_b;
	private boolean is_available;
	
	
	public int getPc_item_id() {
		return pc_item_id;
	}
	public void setPc_item_id(int pc_item_id) {
		this.pc_item_id = pc_item_id;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public String getPc_item_name() {
		return pc_item_name;
	}
	public void setPc_item_name(String pc_item_name) {
		this.pc_item_name = pc_item_name;
	}
	public int getPrice_s() {
		return price_s;
	}
	public void setPrice_s(int price_s) {
		this.price_s = price_s;
	}
	public int getPrice_a() {
		return price_a;
	}
	public void setPrice_a(int price_a) {
		this.price_a = price_a;
	}
	public int getPrice_b() {
		return price_b;
	}
	public void setPrice_b(int price_b) {
		this.price_b = price_b;
	}
	public boolean isIs_available() {
		return is_available;
	}
	public void setIs_available(boolean is_available) {
		this.is_available = is_available;
	}
	
	
	@Override
	public String toString() {
		return "PurchaseItemsDTO [pc_item_id=" + pc_item_id + ", category_id=" + category_id + ", pc_item_name="
				+ pc_item_name + ", price_s=" + price_s + ", price_a=" + price_a + ", price_b=" + price_b
				+ ", is_available=" + is_available + "]";
	}
	
	
	
	
	
	
	
	

}
