package com.project.foodiefoodie.member.domain;
import lombok.*;
import java.util.Date;

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class Master extends Member{
    private String businessNo;
    private String masterName;
    private String storeName;
    private String storeAddress;
    private String foodCategories;
    private int storeRegDate;
    private String hotDeal;
    private String storeCallNumber;


}