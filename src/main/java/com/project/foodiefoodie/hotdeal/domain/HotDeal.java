package com.project.foodiefoodie.hotdeal.domain;

import lombok.*;

import java.util.Date;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class HotDeal {

    private String businessNo;
    private int discountPrice;

}
