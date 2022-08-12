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
    private String content;
    private Date lastUpdated;
    private String title;

    private String hashTag;
    private String menu;
    private int price;

    private MultipartFile titleImg;
    private List<MultipartFile> detailImgList;
    private List<MultipartFile> menuImgList;
}
