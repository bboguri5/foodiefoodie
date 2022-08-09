package com.project.foodiefoodie.proBoard.domain;

import lombok.*;

import java.util.Date;


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

}
