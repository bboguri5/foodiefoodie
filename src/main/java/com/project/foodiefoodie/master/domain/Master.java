package com.project.foodiefoodie.master.domain;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Master {

    private String businessNo;
    private String email;
    private String masterName;
    private String storeName;
    private String storeAddress;
    private String foodCategories;
    private Date storeRegDate;
    private char hotDeal;
    private String storeCallNumber;
}
