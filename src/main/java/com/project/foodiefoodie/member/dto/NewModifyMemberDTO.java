package com.project.foodiefoodie.member.dto;


import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class NewModifyMemberDTO {

    private String nickName;
    private String phoneNumber;
    private String email;
    private String address; // 주소(도로명 주소)
    private String detailAddress; // 상세 주소 : 동, 호수  // ex) 101동 502호
    private String extraAddress; // 참고 주소 : 행정구역 동, 건물 명   // ex) 가산동, 남성프라자



}
