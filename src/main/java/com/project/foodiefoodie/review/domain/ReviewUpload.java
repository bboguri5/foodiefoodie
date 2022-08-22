package com.project.foodiefoodie.review.domain;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReviewUpload {

    private long reviewBno;
    private String filePath;
    private String fileName;
}
