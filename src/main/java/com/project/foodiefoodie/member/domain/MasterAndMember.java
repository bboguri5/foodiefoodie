package com.project.foodiefoodie.member.domain;

import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class MasterAndMember extends Member{
    private String businessNo;
    private String masterName;
    private String storeName;
    private String storeAddress;
    private String hotDeal;
    private String storeCallNumber;
    private String detailAddress;
    private String extraAddress;
    private String storeDetailAddress;
    private String storeExtraAddress;
    private String promotionAuth;
}
