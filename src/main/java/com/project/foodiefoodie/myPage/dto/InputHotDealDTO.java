package com.project.foodiefoodie.myPage.dto;


import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class InputHotDealDTO {

    // 모달창에서 들어올때 값
    private int discountPrice; // 퍼센트 값
    private String hotDealRadio; // value 값 ON OFF

}
