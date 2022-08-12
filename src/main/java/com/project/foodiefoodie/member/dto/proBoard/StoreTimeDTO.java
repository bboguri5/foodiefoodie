package com.project.foodiefoodie.member.dto.proBoard;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class StoreTimeDTO {
    private String weekdayOpenTime;
    private String weekdayCloseTime;
    private String weekendOpenTime;
    private String weekendCloseTime;
    private String brakeStartTime;
    private String breakEndTime;
    private String closedDay;
}
