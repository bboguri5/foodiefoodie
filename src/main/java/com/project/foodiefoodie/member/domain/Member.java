package com.project.foodiefoodie.member.domain;

import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class Member {

    private String email; // 회원 아이디 겸 이메일
    private String password; // 비밀번호
    private String nickName; // 닉네임
    private String phoneNumber; // 전화번호
    private int birth; // 생년월일 8자 19950101
    private String address; // 주소
    private String name; // 이름
    private String gender; // 성별
    private Auth auth; // 권한
    private Date regDate; // 가입일자
    private Date recentLoginTime; // 최근 로그인 시간
}
