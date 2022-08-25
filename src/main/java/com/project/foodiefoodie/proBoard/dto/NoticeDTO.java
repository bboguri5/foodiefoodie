package com.project.foodiefoodie.proBoard.dto;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class NoticeDTO {
    private int promotionBno;
    private String content;
    private Date updateDate;
}
