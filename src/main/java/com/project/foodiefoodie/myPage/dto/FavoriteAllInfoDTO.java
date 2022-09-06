package com.project.foodiefoodie.myPage.dto;


import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class FavoriteAllInfoDTO {

    // 즐겨찾기 홍보글 번호
    private int promotionBno;
    // 파일 데이터
    private String fileData;
    private String storeName ; // 가게이름
    private String storeCallNumber; // 가게 번호
    private String hotDeal; // 핫딜ON/OFF
    private String storeAddress; // 주소
    private String storeDetailAddress; //
    private String storeExtraAddress; //
    private double avgStarRate; // 평균 별점

}
