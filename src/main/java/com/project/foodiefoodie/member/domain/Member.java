package com.project.foodiefoodie.member.domain;

import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class Member {
    private String email;
    private String password;
    private String nickName;
    private String phoneNumber;
    private long birth;
    private String address;
    private String name;
    private String gender;
    private String auth;
    private Date registDate;
    private Date loginTime;
    private String detailAddress;
    private String extraAddress;
}
