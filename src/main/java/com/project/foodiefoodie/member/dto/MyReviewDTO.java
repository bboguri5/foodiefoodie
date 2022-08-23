package com.project.foodiefoodie.member.dto;


import lombok.*;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MyReviewDTO {

    private String title;
    private String content;
    private String filePath;
    private String fileName;
}
