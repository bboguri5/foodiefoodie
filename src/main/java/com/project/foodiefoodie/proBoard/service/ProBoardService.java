package com.project.foodiefoodie.proBoard.service;


import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.proBoard.domain.ProBoard;
import com.project.foodiefoodie.proBoard.repository.ProBoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.sound.sampled.Port;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Service
@Log4j2
@RequiredArgsConstructor
public class ProBoardService {

    private final ProBoardMapper proBoardMapper;

    public boolean proBoardSave(ProBoard proBoard) {

        return proBoardMapper.proBoardSave(proBoard);
    }

    public boolean modify(ProBoard proBoard) {
        return proBoardMapper.modify(proBoard);
    }

    public boolean delete(int promotionBno) {
        return proBoardMapper.delete(promotionBno);
    }

    public ProBoard selectOne(int promotionBno) {
        return proBoardMapper.selectOne(promotionBno);
    }

    public Master selectMaster(String businessNo)
    {
        return proBoardMapper.selectMaster(businessNo);
    }


    private String getMasterNewUploadPath(String uploadPath,String businessNo,String newFolder) {

        String newUploadPath = uploadPath;
        newUploadPath += File.separator + businessNo;
        newUploadPath += File.separator + newFolder;

        File dirName = new File(newUploadPath);
        if (!dirName.exists()) dirName.mkdirs();

        return newUploadPath;
    }

//    수정 시 폴더내 이미지 파일 모두 삭제
//    private boolean removeFiles(String uploadPath)
//    {
//
//    }

    public void uploadMasterFile(Map<String,List<MultipartFile>> fileMap, String uploadPath, String businessNo) {

        log.info(" uploadMasterFile service : init ");

        String[] args = {"title","detail","menu"};

        for (int i = 0; i < fileMap.size(); i++) {
            List<MultipartFile> files = fileMap.get(args[i]);
            for (int j = 0; j < files.size(); j++) {
                MultipartFile file = files.get(j);

                if(file.isEmpty()) return;

                log.info(" uploadMasterFile service file : {} ",file.getOriginalFilename());

                String newUploadPath = getMasterNewUploadPath(uploadPath,businessNo,args[i]);
                String newFileName = String.format("%s_%s",args[i]+(j+1), file.getOriginalFilename());
                String fileFullPath = newUploadPath + File.separator + newFileName;
                String responseFilePath = fileFullPath.substring(uploadPath.length());

                if(newUploadPath == null)
                    return ;

                File f = new File(newUploadPath,newFileName);

                try {
                    file.transferTo(f);

                } catch (IOException e) {
                    e.printStackTrace();
                }

                log.info(" uploadMasterFile service fileFullPath : {}" , responseFilePath.replace("\\", "/"));
            }
        }

    }

}
