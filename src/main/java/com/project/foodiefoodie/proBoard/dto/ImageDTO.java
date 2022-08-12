package com.project.foodiefoodie.proBoard.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class ImageDTO {

    private String titleImg;
    private List<String> detailImg;
    private List<String> menuImg;

}
