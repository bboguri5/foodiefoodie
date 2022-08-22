package com.project.foodiefoodie.proBoard.dto;


import com.project.foodiefoodie.proBoard.domain.ProBoard;
import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class StoreTimeDTO  {
    private Integer weekdayOpenTime;
    private Integer weekdayCloseTime;
    private Integer weekendOpenTime;
    private Integer weekendCloseTime;
    private Integer breakStartTime;
    private Integer breakEndTime;
    private String closedDay;

}
