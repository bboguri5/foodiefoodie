package com.project.foodiefoodie.member.domain;

import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class Master extends Member{
    String businessNo;
    String masterName;
    String storeName;
    String storeAddress;
    String foodCategories;
    Date storeRegDate;
    String hotDeal;
    String storeCallNumber;
}
