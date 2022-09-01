package com.project.foodiefoodie.review.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class AvgStarDTO {

    private String businessNo;
    private int reviewCount;
    private int sr;
}
