package com.project.foodiefoodie.common.upload;

import com.project.foodiefoodie.util.FoodieFileUtils;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j2
public class AjaxController {

    public static final String UPLOAD_PATH = "C:\\foodiefoodie\\upload";


    // 비동기 파일 업로딩 처리.
    @PostMapping("/ajax-upload")
    @ResponseBody
    public ResponseEntity<List<String>> ajaxUpload(List<MultipartFile> files) {

        long maxFileSize = 10 * 1024 * 1024;

        if (files != null) {
            log.info("/ajax-upload POST!! - {}", files.get(0).getOriginalFilename());

            List<String> fileNames = new ArrayList<>();


            for (MultipartFile file : files) {

                if (file.getSize() > maxFileSize) {
                    return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
                }

                String fullPath = FoodieFileUtils.uploadFile(file, UPLOAD_PATH);

                fileNames.add(fullPath);
            }

            return new ResponseEntity<>(fileNames, HttpStatus.OK);
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }


    // 이미지 미리보기 출력 위한 비동기 이미지 데이터 전송 처리
    @GetMapping("/loadFile")
    @ResponseBody
    public ResponseEntity<byte[]> loadFile(String fileName) {

        log.info("/loadFile GET! -{}", fileName);

        // 해당 경로 + 파일명을 파일 객체로 포장.
        File file = new File(UPLOAD_PATH + fileName);


        // 해당 경로 + 파일명이 실제로 서버내 존재하지 않는 경우
        if (!file.exists()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }


        try (FileInputStream fis = new FileInputStream(file)) {

            // 확장자 추출
            String ext = FoodieFileUtils.getFileExtension(fileName);

            // 미디어 타입으로 변환 - 이미지가 아니라면 null 리턴
            MediaType mediaType = FoodieFileUtils.getMediaType(ext);

            HttpHeaders headers = new HttpHeaders();

            if (mediaType != null) {
                headers.setContentType(mediaType);
            }
            else { // 이미지가 아니라면
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

                // 파일명 원래대롤 복구! 경로 내용 다 떼고!
                fileName = fileName.substring(fileName.lastIndexOf("_") + 1);


                String encoding = new String(fileName.getBytes("UTF-8"), ("ISO-8859-1"));

                headers.add("Content-Disposition", "attachment; fileName=\"" + encoding + "\"");
            }

            byte[] rawData = IOUtils.toByteArray(fis);

            return new ResponseEntity<>(rawData, headers, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

    }
}
