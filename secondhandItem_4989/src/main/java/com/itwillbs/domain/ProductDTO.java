package com.itwillbs.domain;

public class ProductDTO {
//	
    private int product_id;
//    private int category_id;
    private String category_name;
    //판매자 ID
    private String seller_id;
    //제품명
    private String product_name;
    //판매가격
	private int product_price;
	//구입연도
    private int year_purchase;
    //물품 상태
    private String product_desc;
    private String product_img1;
    private String product_img2;
    private String product_img3;
    private String product_img4;
    private String product_img5;
    private String created_datetime;
    private int view_count;
    private int like_count;
    private String trade_method;
    private String pay_method;
    //거래 지역
    private String trade_area;
//    private String trade_status;
//    private boolean temp_save;
    
    
    @Override
	public String toString() {
		return "ProductDTO [product_id=" + product_id + ", category_name=" + category_name + ", seller_id=" + seller_id
				+ ", product_name=" + product_name + ", product_price=" + product_price + ", year_purchase="
				+ year_purchase + ", product_desc=" + product_desc + ", product_img1=" + product_img1
				+ ", product_img2=" + product_img2 + ", product_img3=" + product_img3 + ", product_img4=" + product_img4
				+ ", product_img5=" + product_img5 + ", created_datetime=" + created_datetime + ", view_count="
				+ view_count + ", like_count=" + like_count + ", trade_method=" + trade_method + ", pay_method="
				+ pay_method + ", trade_area=" + trade_area + "]";
	}


	public int getProduct_id() {
		return product_id;
	}


	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}


	public String getCategory_name() {
		return category_name;
	}


	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}


	public String getSeller_id() {
		return seller_id;
	}


	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}


	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public int getProduct_price() {
		return product_price;
	}


	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}


	public int getYear_purchase() {
		return year_purchase;
	}


	public void setYear_purchase(int year_purchase) {
		this.year_purchase = year_purchase;
	}


	public String getProduct_desc() {
		return product_desc;
	}


	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}


	public String getProduct_img1() {
		return product_img1;
	}


	public void setProduct_img1(String product_img1) {
		this.product_img1 = product_img1;
	}


	public String getProduct_img2() {
		return product_img2;
	}


	public void setProduct_img2(String product_img2) {
		this.product_img2 = product_img2;
	}


	public String getProduct_img3() {
		return product_img3;
	}


	public void setProduct_img3(String product_img3) {
		this.product_img3 = product_img3;
	}


	public String getProduct_img4() {
		return product_img4;
	}


	public void setProduct_img4(String product_img4) {
		this.product_img4 = product_img4;
	}


	public String getProduct_img5() {
		return product_img5;
	}


	public void setProduct_img5(String product_img5) {
		this.product_img5 = product_img5;
	}


	public String getCreated_datetime() {
		return created_datetime;
	}


	public void setCreated_datetime(String created_datetime) {
		this.created_datetime = created_datetime;
	}


	public int getView_count() {
		return view_count;
	}


	public void setView_count(int view_count) {
		this.view_count = view_count;
	}


	public int getLike_count() {
		return like_count;
	}


	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}


	public String getTrade_method() {
		return trade_method;
	}


	public void setTrade_method(String trade_method) {
		this.trade_method = trade_method;
	}


	public String getPay_method() {
		return pay_method;
	}


	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}


//	public String getTrade_area() {
//		return trade_area;
//	}
//
//	public void setTrade_area(String trade_area) {
//		this.trade_area = trade_area;
//	}
    
//	@Override
//	public String toString() {
//	    return "ProductDTO{" +
////	            "product_id=" + product_id +
////	            ", category_id=" + category_id +
//	            ", seller_id=" + seller_id +
//	            ", product_name='" + product_name + '\'' +
//	            ", product_price=" + product_price +
//	            ", year_purchase=" + year_purchase +
//	            ", product_desc='" + product_desc + '\'' +
//	            ", product_img1='" + product_img1 + '\'' +
//	            ", product_img2='" + product_img2 + '\'' +
//	            ", product_img3='" + product_img3 + '\'' +
//	            ", product_img4='" + product_img4 + '\'' +
//	            ", product_img5='" + product_img5 + '\'' +
//	            ", created_datetime='" + created_datetime + '\'' +
//	            ", view_count=" + view_count +
//	            ", like_count=" + like_count +
//	            ", trade_method='" + trade_method + '\'' +
//	            ", pay_method='" + pay_method + '\'' +
//	            ", trade_area='" + trade_area + '\'' +
//	            '}';
//	}

}