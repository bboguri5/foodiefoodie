package com.project.foodiefoodie.review.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReviewFileDTO {
    long reviewBno;
    String filePath;
    String fileName;
    String fileByte;
    long fileSize;
    String fileData;
    String fileType;



}
