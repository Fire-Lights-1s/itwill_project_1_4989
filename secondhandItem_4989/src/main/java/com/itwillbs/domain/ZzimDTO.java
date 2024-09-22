package com.itwillbs.domain;

public class ZzimDTO {
	
	private int zzim_id;
	private int product_id;
	private String member_id;

	
	@Override
	public String toString() {
		return "ZzimDTO [zzim_id=" + zzim_id + ", product_id=" + product_id + ", member_id=" + member_id + "]";
	}
	public int getZzim_id() {
		return zzim_id;
	}
	public void setZzim_id(int zzim_id) {
		this.zzim_id = zzim_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}
