
package com.project.foodiefoodie.member.domain;

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
    private String storeDetailAddress;
    private String storeExtraAddress;
    private Date storeRegDate;
    private char hotDeal;
    private String storeCallNumber;
}