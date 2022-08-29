package com.project.foodiefoodie.proBoard.dto;

import com.project.foodiefoodie.proBoard.domain.ProBoard;
import lombok.*;
import org.springframework.security.web.PortResolverImpl;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class ImageDTO extends FileDTO{

    private String fileName;
    private String filePath;
    private String type;
}
