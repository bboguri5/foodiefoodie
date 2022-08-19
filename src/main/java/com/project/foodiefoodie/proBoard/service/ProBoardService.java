package com.project.foodiefoodie.proBoard.service;


import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.proBoard.domain.ProBoard;
import com.project.foodiefoodie.proBoard.repository.ProBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.sound.sampled.Port;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

@Service
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


    private String getMasterNewUploadPath(String uploadPath,String businessNo,String newFileName) {
        String[] args = {"title","detail","menu"};

        String newUploadPath = uploadPath;
        newUploadPath += File.separator + businessNo;
        if(newFileName.contains(args[0]))
            newUploadPath += File.separator + args[0];
        else if(newFileName.contains(args[1]))
            newUploadPath += File.separator + args[1];
        else if(newFileName.contains(args[2]))
            newUploadPath += File.separator + args[2];
        else { return null;}

        File dirName = new File(newUploadPath);
        if (!dirName.exists()) dirName.mkdirs();

        return newUploadPath;
    }

//    수정 시 폴더내 이미지 파일 모두 삭제
//    private boolean removeFiles(String uploadPath)
//    {
//
//    }

    public String uploadMasterFile(MultipartFile file, String uploadPath, String businessNo, String newFileName) {

        String newUploadPath = getMasterNewUploadPath(uploadPath,businessNo,newFileName);
        newFileName = newFileName + "_" + file.getOriginalFilename();
        if(newUploadPath == null)
            return null;

        File f = new File(newUploadPath,newFileName);

        try {
            file.transferTo(f);

        } catch (IOException e) {
            e.printStackTrace();
        }

        String fileFullPath = newUploadPath + File.separator + newFileName;
        String responseFilePath = fileFullPath.substring(uploadPath.length());

        return responseFilePath.replace("\\", "/");
    }

}
