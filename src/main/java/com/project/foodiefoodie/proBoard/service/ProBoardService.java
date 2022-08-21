package com.project.foodiefoodie.proBoard.service;


import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.proBoard.domain.ProBoard;
import com.project.foodiefoodie.proBoard.dto.ImageDTO;
import com.project.foodiefoodie.proBoard.dto.MenuDTO;
import com.project.foodiefoodie.proBoard.dto.StoreTimeDTO;
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
    public final String UPLOAD_PATH = "C:\\foodiefoodie\\upload";
    private final ProBoardMapper proBoardMapper;

    public boolean saveProBoard(ProBoard proBoard, StoreTimeDTO storeTime, List<String[]> menuList, Map<String, List<MultipartFile>> fileMap) {

        log.info(" saveProBoard service init - {}",proBoard);
        boolean result = proBoardMapper.saveProBoard(proBoard); // content , title .. 저장

        if (result) {
            int promotionBno = proBoardMapper.selectPromotionBno(proBoard.getBusinessNo());

            proBoardMapper.saveProBoardStoreTime(promotionBno, storeTime); // storeTime 저장
            for (int i = 0; i < menuList.get(0).length; i++) {
                proBoardMapper.saveProBoardMenu(promotionBno, menuList.get(0)[i], Integer.parseInt(menuList.get(1)[i])); // menu 저장
            }
            uploadMasterFile(fileMap, UPLOAD_PATH, proBoard, promotionBno); // img 저장
        }

        return result;
    }


//    public boolean saveProBoardStoreTime(int promotionBno,StoreTimeDTO storeTime)
//    {
//        return proBoardMapper.saveProBoardStoreTime(promotionBno,storeTime);
//    }

    public boolean modify(ProBoard proBoard) {
        return proBoardMapper.modify(proBoard);
    }

    public boolean delete(int promotionBno) {
        return proBoardMapper.delete(promotionBno);
    }

    public ProBoard selectOne(int promotionBno) {
        return proBoardMapper.selectOne(promotionBno);
    }

    public Master selectMaster(String businessNo) {
        return proBoardMapper.selectMaster(businessNo);
    }


    private String getMasterNewUploadPath(String uploadPath, String businessNo, String newFolder) {

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

    public boolean uploadMasterFile(Map<String, List<MultipartFile>> fileMap, String uploadPath, ProBoard proBoard, int promotionBno) {

        log.info(" uploadMasterFile service - init {}",promotionBno);

        String[] args = {"title", "detail", "menu"};
        Map<String,String> titleMap = new HashMap<>();

        for (int i = 0; i < fileMap.size(); i++) {
            List<MultipartFile> files = fileMap.get(args[i]);
            for (int j = 0; j < files.size(); j++) {
                MultipartFile file = files.get(j);

                if (file.isEmpty()) break;

                log.info(" uploadMasterFile service file : {} ", file.getOriginalFilename());

                String newUploadPath = getMasterNewUploadPath(uploadPath, proBoard.getBusinessNo(), args[i]);
                String newFileName = String.format("%s_%s", args[i] + (j + 1), file.getOriginalFilename());
                String fileFullPath = newUploadPath + File.separator + newFileName;
                String responseFilePath = fileFullPath.substring(uploadPath.length());


                if (newUploadPath.equals("")) break;

                File f = new File(newUploadPath, newFileName);

                try {
                    saveProBoardImagePath(promotionBno, fileFullPath, newFileName, args[i]);
                    file.transferTo(f);

                } catch (IOException e) {
                    e.printStackTrace();
                }

                log.info(" uploadMasterFile service fileFullPath : {}", responseFilePath.replace("\\", "/"));
            }

        }

        return true;
    }

    public void saveProBoardImagePath(int promotionBno, String fileFullPath, String newFileName, String type) {

        log.info("saveProBoardImage service - {} ", type);

        if (type.equals("menu")) {
            List<Integer> menuNoList = proBoardMapper.selectMenuNo(promotionBno);
            for (int menuNo : menuNoList) {
                log.info("save ProBoardImage service -  menu_no ASC {} ", menuNo);
                proBoardMapper.saveProBoardImage(promotionBno, new ImageDTO(menuNo, newFileName, fileFullPath, type));
            }
            return;
        }
        proBoardMapper.saveProBoardImage(promotionBno, new ImageDTO(0, newFileName, fileFullPath, type));
    }


}
