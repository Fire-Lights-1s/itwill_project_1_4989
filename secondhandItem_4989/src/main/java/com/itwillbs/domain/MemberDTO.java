package com.itwillbs.domain;

import java.sql.Timestamp;

public class MemberDTO {

    private String member_id;
    private String pass;
    private String nickname;
    private String name;
    private String jumin;  // 주민등록번호
    private String phone;
    private String email;
    private Timestamp created_at;

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

    public String getJumin() {
        return jumin;
    }

    public void setJumin(String jumin) {
        this.jumin = jumin;
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

    // toString 메서드 (디버깅용)
    @Override
    public String toString() {
        return "MemberDTO{" +
                "member_id='" + member_id + '\'' +
                ", pass='" + pass + '\'' +
                ", nickname='" + nickname + '\'' +
                ", name='" + name + '\'' +
                ", jumin='" + jumin + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", created_at=" + created_at +
                '}';
    }
}
