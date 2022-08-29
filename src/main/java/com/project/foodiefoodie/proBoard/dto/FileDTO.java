package com.project.foodiefoodie.proBoard.dto;


import com.project.foodiefoodie.util.FoodieFileUtils;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class FileDTO {

    private int promotionBno;
    private String filePath;
    private String fileName;

    private String fileMediaType;
    private Long fileSize;
    private String fileByte;

    private String type;


    // 입력
    public FileDTO(int promotionBno , String filePath, String fileName , String type) {

        this.promotionBno = promotionBno;
        this.filePath = filePath;
        this.fileName = fileName;

        File file = new File(filePath, fileName);
        try {
            this.fileMediaType = Files.probeContentType(file.toPath());
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
        this.fileSize = file.length();
        this.fileByte = FoodieFileUtils.getFileContent(file.getPath());
    }
}
