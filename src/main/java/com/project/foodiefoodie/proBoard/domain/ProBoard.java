package com.project.foodiefoodie.proBoard.domain;

import com.project.foodiefoodie.proBoard.dto.FileDTO;
import com.project.foodiefoodie.proBoard.dto.StoreTimeDTO;
import com.project.foodiefoodie.util.DateFormatUtils;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;
import java.util.Map;


@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ProBoard extends StoreTimeDTO {

    private String businessNo;
    private int promotionBno;

    @Setter(AccessLevel.NONE) // setter 따로 사용하기 위함
    private Date lastUpdated;
    private String content;
    private String title;
    private String hashTag;
    private float avgStarRate;
    private int review_cnt;
    private int report_cnt;

    private String formatDate;


    public void setLastUpdated(Date lastUpdated) {
        this.lastUpdated = lastUpdated;
        this.formatDate = this.lastUpdated != null ? DateFormatUtils.formatTimeVer1(this.lastUpdated) : null;
    }
}
