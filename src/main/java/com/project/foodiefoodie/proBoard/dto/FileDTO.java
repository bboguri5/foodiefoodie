package com.project.foodiefoodie.proBoard.dto;


import com.project.foodiefoodie.util.FoodieFileUtils;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

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
    private String fileData;


    // 입력
    public FileDTO(int promotionBno , MultipartFile multipartFile , String filePath) {

        this.promotionBno = promotionBno;
        this.filePath = filePath;
        this.fileName = multipartFile.getOriginalFilename();
        System.out.println(" filename : " + multipartFile.getOriginalFilename());
        System.out.println(filePath + " " + fileName);
        this.fileMediaType = multipartFile.getContentType();
        this.fileByte = FoodieFileUtils.getFileContent(filePath + File.separator + this.fileName);
        this.fileSize = multipartFile.getSize();
        this.fileData = String.format("data:%s;base64,%s",fileMediaType,fileByte);

        System.out.println(fileMediaType + " " + fileSize+ " " + fileByte);

    }
}
