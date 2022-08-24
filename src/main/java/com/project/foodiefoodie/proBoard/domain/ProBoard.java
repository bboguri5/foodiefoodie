package com.project.foodiefoodie.proBoard.domain;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;
import java.util.Map;


@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ProBoard {

    private String businessNo;
    private int promotionBno;
    private Date lastUpdated;
    private String content;
    private String title;
    private String hashTag;
    private int avgStarRate;
    private int review_cnt;
    private int report_cnt;
    private String filePath;
    private String fileName;

}
