package com.itwillbs.domain;

import java.sql.Timestamp;

public class MemberDTO {

    private String userId;
    private String password;
    private String nickname;
    private String name;
    private String jumin;  // 주민등록번호
    private String phoneNumber;
    private String email;
    private Timestamp date;

    // 기본 생성자
    public MemberDTO() {
    }

    // 모든 필드를 받는 생성자
    public MemberDTO(String userId, String password, String nickname, String name,
                     String jumin, String phoneNumber, String email, Timestamp date) {
        this.userId = userId;
        this.password = password;
        this.nickname = nickname;
        this.name = name;
        this.jumin = jumin;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.date = date;
    }

    // getter와 setter 메서드
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
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
                "userId='" + userId + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", name='" + name + '\'' +
                ", jumin='" + jumin + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", email='" + email + '\'' +
                ", date=" + date +
                '}';
    }
}
