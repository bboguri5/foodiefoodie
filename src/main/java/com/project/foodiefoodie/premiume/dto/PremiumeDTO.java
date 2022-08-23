package com.project.foodiefoodie.premiume.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PremiumeDTO {
    private long promotionBno;
    private int startDate;
    private int endDate;
    private String complete;

    private String title;
}
