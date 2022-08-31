package com.project.foodiefoodie.proBoard.service;


import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.proBoard.domain.ProBoard;
import com.project.foodiefoodie.proBoard.dto.*;
import com.project.foodiefoodie.proBoard.repository.ProBoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;

@Service
@Log4j2
@RequiredArgsConstructor
public class ProBoardService {
    private final ProBoardMapper proBoardMapper;


    public boolean modify(ProBoard proBoard) {
        return proBoardMapper.modify(proBoard);
    }

    public boolean delete(int promotionBno) {
        return proBoardMapper.delete(promotionBno);
    }

    @Transactional
    public boolean saveProBoard(ProBoard proBoard, List<String[]> menuList, Map<String, List<MultipartFile>> fileMap) {

        log.info(" saveProBoard service init - {}", proBoard);
        boolean result = proBoardMapper.saveProBoard(proBoard); // content , title .. 저장

        if (result) {

            log.info(" saveProBoard result init - {} ", result);
            int promotionBno = proBoardMapper.selectPromotionBno(proBoard.getBusinessNo());
            proBoard.setPromotionBno(promotionBno);

            proBoardMapper.saveStoreTime(proBoard);
            saveMenu(promotionBno, menuList);

            for (String key : fileMap.keySet()) {
                saveImgInfo(uploadImgFile(proBoard, fileMap.get(key), key));
            }
        }

        return result;
    }

    public ProBoard selectProBoard(int promotionBno) {
        return proBoardMapper.selectProBoard(promotionBno);
    }

    public Master selectMaster(String businessNo) {
        return proBoardMapper.selectMaster(businessNo);
    }

    /* ===================================== files ===================================== */

    // upload path 생성 함수
    // ex) C:\foodiefoodie\proBoard\1234-12-12345\detail
    private String getNewUploadPath(String newFolder, String businessNo) {

        String newUploadPath = "C:\\foodiefoodie\\proBoard";
        newUploadPath += File.separator + businessNo;
        newUploadPath += File.separator + newFolder;

        File dirName = new File(newUploadPath);
        if (!dirName.exists()) dirName.mkdirs();

        log.info(" service getNewUploadPath {} ", newUploadPath);
        return newUploadPath;
    }

    private List<FileDTO> uploadImgFile(ProBoard proBoard, List<MultipartFile> fileList, String folderName) {

        log.info(" service uploadImgFile {}", proBoard.getPromotionBno());

        List<FileDTO> fileDTOList = new ArrayList<>();
        for (MultipartFile imgFile : fileList) {

            if (imgFile.getSize() == 0) return null;

            if (imgFile.getOriginalFilename().equals("default")) {
                FileDTO fileDTO = new FileDTO();
                fileDTO.setFilePath("\\img");
                fileDTO.setFileName("foodie_default.PNG");
                fileDTOList.add(fileDTO);
                continue;
            }

            try {
                String newPath = getNewUploadPath(folderName, proBoard.getBusinessNo());
                File file = new File(newPath, Objects.requireNonNull(imgFile.getOriginalFilename()));
                imgFile.transferTo(file);

                fileDTOList.add(new FileDTO(proBoard.getPromotionBno(), file));
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        return fileDTOList;
    }

    private boolean saveImgInfo(List<FileDTO> fileDTOList) {

        if (fileDTOList == null) return false;

        List<Boolean> resultList = new ArrayList<>();
        for (FileDTO fileDTO : fileDTOList) {
            resultList.add(proBoardMapper.saveFiles(fileDTO));
        }
        return !resultList.contains(false);
    }

    public List<FileDTO> selectFiles(int promotionBno , String type) {return proBoardMapper.selectFiles(promotionBno,type);}

    /* ===================================== notice ===================================== */

    public List<NoticeDTO> selectNotice(int promotionBno) {
        return proBoardMapper.selectNotice(promotionBno);
    }

    public boolean saveNotice(NoticeDTO noticeDTO) {return proBoardMapper.saveNotice(noticeDTO);}

    public boolean deleteNotice(int noticeNo) {
        return proBoardMapper.deleteNotice(noticeNo);
    }

    /* ===================================== menu ===================================== */
    public List<MenuDTO> selectMenuInfo(int promotionBno) {
        return proBoardMapper.selectMenuInfo(promotionBno);
    }

    private boolean saveMenu(int promotionBno, List<String[]> menuList) {
        List<Boolean> resultList = new ArrayList<>();
        for (int i = 0; i < menuList.get(0).length; i++) {
            if (menuList.get(0)[i].isEmpty() && menuList.get(1)[i].isEmpty()) return false;
            resultList.add(proBoardMapper.saveMenu(
                    promotionBno, menuList.get(0)[i]
                    , Integer.parseInt(menuList.get(1)[i]))
            );
        }
        return !resultList.contains(false);
    }


}
