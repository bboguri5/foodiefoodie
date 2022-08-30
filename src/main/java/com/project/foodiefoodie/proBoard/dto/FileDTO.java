package com.project.foodiefoodie.proBoard.dto;


import com.project.foodiefoodie.util.FoodieFileUtils;
import lombok.*;
import lombok.extern.log4j.Log4j2;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

@Log4j2
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class FileDTO extends StoreTimeDTO {

    private int promotionBno;
    private String filePath;
    private String fileName;

    private String fileMediaType;
    private Long fileSize;
    private String fileByte;
    private String fileData;

    // 입력
    public FileDTO(int promotionBno, File file) {
        System.out.println(" File DTO init ");
        this.promotionBno = promotionBno;
        this.filePath = file.toPath().getParent().toString();
        this.fileName = file.getName();

        try {
            this.fileMediaType = Files.probeContentType(file.toPath());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        this.fileByte = FoodieFileUtils.getFileContent(file.getPath());
        this.fileSize = file.length();
        this.fileData = String.format("data:%s;base64,%s", fileMediaType, fileByte);

        log.info(" object FileDTO : {}", this.toString());
    }
}
