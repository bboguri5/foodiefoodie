package com.project.foodiefoodie.proBoard.domain;

import lombok.*;

import java.util.Date;
import java.util.Map;


@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ProBoard {

    private String businessNo;
    private int promotionBno;
    private String content;
    private Date lastUpdated;
    private String title;

    private String hashTag;
    private String menu;
    private int price;
    private Map<String,String> menuImgs;
}
