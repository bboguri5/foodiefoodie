package com.project.foodiefoodie.myPage.dto;


import lombok.*;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ModiHotDealPercentDTO {

        // 핫딜 퍼센트 고칠때 쓰는
    private String businessNo; // 사업자번호
    private int discountPrice; // 퍼센트 값


}
