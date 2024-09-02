package com.itwillbs.domain;

import java.sql.Timestamp;

public class MemberDTO {

    private String id;
    private String pass;
    private String nickname;
    private String name;
    private String jumin;  // 주민등록번호
    private String phone;
    private String email;
    private Timestamp date;

    // 기본 생성자
    public MemberDTO() {
    }

    // 모든 필드를 받는 생성자
    public MemberDTO(String userId, String password, String nickname, String name,
                     String jumin, String phoneNumber, String email, Timestamp date) {
        this.id = userId;
        this.pass = password;
        this.nickname = nickname;
        this.name = name;
        this.jumin = jumin;
        this.phone = phoneNumber;
        this.email = email;
        this.date = date;
    }

    // getter와 setter 메서드
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getjumin() {
        return jumin;
    }

    public void jumin(String jumin) {
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

    public Timestamp date() {
        return date;
    }

    public void setdate(Timestamp date) {
        this.date = date;
    }

    // toString 메서드 (디버깅용)
    @Override
    public String toString() {
        return "MemberDTO{" +
                "id='" + id + '\'' +
                ", pass='" + pass + '\'' +
                ", nickname='" + nickname + '\'' +
                ", name='" + name + '\'' +
                ", jumin='" + jumin + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", date=" + date +
                '}';
    }
}
