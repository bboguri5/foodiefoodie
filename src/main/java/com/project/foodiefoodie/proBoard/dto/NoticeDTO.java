package com.project.foodiefoodie.proBoard.dto;

import com.project.foodiefoodie.util.DateFormatUtils;
import lombok.*;
import org.springframework.data.relational.core.mapping.Column;

import java.util.Date;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class NoticeDTO {

    private int promotionBno;
    private int noticeNo;
    private String content;
    @Setter(AccessLevel.NONE) // setter 따로 사용하기 위함
    private Date updateDate;
    private String updateAFewDaysAgo;
    private boolean newUpdateFlag;

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
        this.updateAFewDaysAgo = DateFormatUtils.makeFewDaysAgo(updateDate);

        if(DateFormatUtils.checkNewUpdate(updateDate))
            this.newUpdateFlag = true;
    }
}
