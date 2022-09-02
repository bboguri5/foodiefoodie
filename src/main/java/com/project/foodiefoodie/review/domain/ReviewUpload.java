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
    String fileData; // 이거 이미지 파일일에 넣어준다 src
    String fileType;
    byte[] fileByteArray;

}
