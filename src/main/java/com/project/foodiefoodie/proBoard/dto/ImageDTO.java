package com.project.foodiefoodie.proBoard.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class ImageDTO {

    private MultipartFile titleImg;
    private List<MultipartFile> detailImg;
    private List<MultipartFile> menuImg;

}
