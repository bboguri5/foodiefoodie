package com.project.foodiefoodie.proBoard.dto;


import com.project.foodiefoodie.member.domain.Master;
import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class StoreTimeDTO extends Master {

    private String weekdayOpenTime;
    private String weekdayCloseTime;
    private String weekendOpenTime;
    private String weekendCloseTime;
    private String breakStartTime;
    private String breakEndTime;
    private String closedDay;

}
