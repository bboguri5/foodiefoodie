package com.project.foodiefoodie.proBoard.domain;

import com.project.foodiefoodie.proBoard.dto.FileDTO;
import com.project.foodiefoodie.proBoard.dto.StoreTimeDTO;
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
    private Date lastUpdated;
    private String content;
    private String title;
    private String hashTag;
    private float avgStarRate;
    private int review_cnt;
    private int report_cnt;
}
