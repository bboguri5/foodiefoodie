package com.project.foodiefoodie.review.domain;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReviewUpload {

    long reviewBno;
    String filePath;
    String fileName;
    String fileByte;
    long fileSize;
    String fileData;
    String fileType;
    byte[] fileByteArray;

}
