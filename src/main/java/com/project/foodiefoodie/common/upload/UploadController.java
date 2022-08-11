package com.project.foodiefoodie.common.upload;

import com.project.foodiefoodie.util.FileUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j2
public class UploadController {

    public static final String UPLOAD_PATH = "E:\\foodiefoodie\\upload";



    @PostMapping("/ajax-upload")
    @ResponseBody
    public ResponseEntity<List<String>> ajaxUpload(List<MultipartFile> files) {

        log.info("/ajax-upload POST!! - {}", files.get(0).getOriginalFilename());

        List<String> fileNames = new ArrayList<>();


        for (MultipartFile file : files) {

            String fullPath = FileUtils.uploadFile(file, UPLOAD_PATH);

            fileNames.add(fullPath);
        }

        return new ResponseEntity<>(fileNames, HttpStatus.OK);
    }

}
