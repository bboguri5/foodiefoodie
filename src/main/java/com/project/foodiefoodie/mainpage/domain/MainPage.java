package com.project.foodiefoodie.mainpage.domain;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MainPage {
    private String businessNo;
    private String storeName;
    private String storeAddress;
    private double avgStarRate;
    private Long reviewCnt;
    private char hotDeal;
    private String filePath;
    private int discountPrice;
    private Long startDate;
    private Long endDate;
}
