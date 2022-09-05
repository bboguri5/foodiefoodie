package com.project.foodiefoodie.member.dto;


import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@ToString
@AllArgsConstructor
public class BusinessNoAndPromotionNoDTO {

    // 비즈니스 넣으면 프로모션 번호 나오는 메서드에 쓸것
    private String businessNo;
    private int promotionBno;

}
