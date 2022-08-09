package com.project.foodiefoodie.member.domain;

import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class Member {
    String email;
    String password;
    String nickName;
    String phoneNumber;
    long birth;
    String address;
    String name;
    String gender;
    String auth;
    Date registDate;
    Date loginTime;
}
