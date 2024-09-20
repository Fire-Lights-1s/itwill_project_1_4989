package com.itwillbs.domain;

import java.sql.Timestamp;

public class MemberDTO {

    private String member_id;
    private String pass;
    private String nickname;
    private String name;
    private String phone;
    private String email;
    private String profile_img;
    private Timestamp created_at;
    private int allTX;
    private double rating;
    private boolean is_withdrawn;
    private String social_loginfo;
    
    public double getRating() {
		return rating;
    }
    
    public void setRating(double rating) {
		this.rating = rating;
	}
    
    public boolean getIs_withdrawn() {
		return is_withdrawn;
	}

	
	public void setIs_withdrawn(boolean is_withdrawn) {
		this.is_withdrawn = is_withdrawn;
	}

	// 기본 생성자
    public MemberDTO() {
    }

    // 모든 필드를 받는 생성자
//    public MemberDTO(String member_id, String password, String nickname, String name,
//                     String jumin, String phoneNumber, String email, Timestamp created_at) {
//        this.member_id = member_id;
//        this.pass = password;
//        this.nickname = nickname;
//        this.name = name;
//        this.jumin = jumin;
//        this.phone = phoneNumber;
//        this.email = email;
//        this.created_at = created_at;
//    }

    // getter와 setter 메서드
    
    public String getMember_id() {
        return member_id;
    }
    
    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }
    
	public int getAllTX() {
		return allTX;
	}

	public void setAllTX(int allTX) {
		this.allTX = allTX;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }
    
    public String getSocial_loginfo() {
        return social_loginfo;
    }

    public void setSocial_loginfo(String social_loginfo) {
        this.social_loginfo = social_loginfo;
    }

    // toString 메서드 (디버깅용)
    @Override
    public String toString() {
        return "MemberDTO{" +
                "member_id='" + member_id + '\'' +
                ", pass='" + pass + '\'' +
                ", nickname='" + nickname + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", created_at=" + created_at +
                ", social_loginfo=" + social_loginfo +
                ", is_withdrawn=" + is_withdrawn +
                '}';
    }
}
