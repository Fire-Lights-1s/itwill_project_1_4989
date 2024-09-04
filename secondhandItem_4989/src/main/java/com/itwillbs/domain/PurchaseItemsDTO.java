package com.itwillbs.domain;

public class PurchaseItemsDTO {
	
	private int pc_item_id;
	private String category_name;
	private String item_maker;
	private String pc_item_name;
	private int price_s;
	private int price_a;
	private int price_b;
	private boolean available;
	
	
	public int getPc_item_id() {
		return pc_item_id;
	}
	public void setPc_item_id(int pc_item_id) {
		this.pc_item_id = pc_item_id;
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
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public boolean isAvailable() {
		return available;
	}
	public void setAvailable(boolean available) {
		this.available = available;
	}
	
	
	public String getItem_maker() {
		return item_maker;
	}
	public void setItem_maker(String item_maker) {
		this.item_maker = item_maker;
	}
	@Override
	public String toString() {
		return "PurchaseItemsDTO [pc_item_id=" + pc_item_id + ", category_name=" + category_name + ", item_maker="
				+ item_maker + ", pc_item_name=" + pc_item_name + ", price_s=" + price_s + ", price_a=" + price_a
				+ ", price_b=" + price_b + ", available=" + available + "]";
	}


	

	

	
	
	
	
	

}
