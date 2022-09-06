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
import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class ProBoardService {
    private final ProBoardMapper proBoardMapper;

    @Transactional
    public int saveProBoard(ProBoard proBoard, List<String[]> menuList, Map<String, List<MultipartFile>> fileMap) {

        log.info(" saveProBoard service init - {}", proBoard);
        boolean result = proBoardMapper.saveProBoard(proBoard); // content , title .. 저장

        if (result) {

            log.info(" saveProBoard result init - {} ", result);
            int promotionBno = proBoardMapper.selectPromotionBno(proBoard.getBusinessNo());

            proBoard.setPromotionBno(promotionBno);

            saveMenuList(proBoard, menuList, fileMap.get("menu"));

            proBoardMapper.saveStoreTime(proBoard);

            for (String key : fileMap.keySet()) {
                if (!key.equals("menu")) {
                    System.out.println(key.equals("menu"));
                    List<FileDTO> fileDTOList = uploadSaveFiles(proBoard, fileMap.get(key), key);
                    if (fileDTOList != null) saveFileInfo(fileDTOList);
                }

            }
        }

        return proBoard.getPromotionBno();
    }


    @Transactional
    public boolean modifyProBoard(ProBoard proBoard, List<String[]> menuList, Map<String, List<MultipartFile>> fileMap) {
        log.info(" service modifyProBoard {} ", proBoard.getPromotionBno());
        int promotionBno = proBoard.getPromotionBno();

        proBoardMapper.modifyProBoard(proBoard);
        proBoardMapper.modifyStoreTime(proBoard);

        proBoardMapper.deleteMenuInfo(promotionBno); // menu db 전체 삭제
        saveMenuList(proBoard, menuList, fileMap.get("menu")); // menu & menuFiles 전체 저장

        for (String key : fileMap.keySet()) {
            if (key.equals("menu") || key.isEmpty()) continue; // 메뉴는 비동기에서 DB 삭제되어 자동으로 파일도 삭제됨

            proBoardMapper.deleteFileAllInfo(promotionBno, key);
            saveFileInfo(uploadSaveFiles(proBoard, fileMap.get(key), key));
        }

        for (String key : fileMap.keySet()) {
            deleteLocalFile(proBoard.getBusinessNo(), key, fileMap.get(key));
        }

        return true;
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
    private String getNewUploadPath(String businessNo, String newFolder) {

        String newUploadPath = "C:\\foodiefoodie\\proBoard";
        newUploadPath += File.separator + businessNo;
        newUploadPath += File.separator + newFolder;

        File dirName = new File(newUploadPath);
        if (!dirName.exists()) dirName.mkdirs();

        log.info(" service getNewUploadPath {} ", newUploadPath);
        return newUploadPath;
    }

    private boolean deleteLocalFile(String businessNo, String folderName, List<MultipartFile> fileList) {
        List<Boolean> result = new ArrayList<>();
        List<String> requestFileNames = new ArrayList<>();
        String newUploadPath = "C:\\foodiefoodie\\proBoard";

        newUploadPath += File.separator + businessNo;
        newUploadPath += File.separator + folderName;

        File folder = new File(newUploadPath);

        for (MultipartFile file : fileList) {
            if (file.getSize() == 0) return false;
            requestFileNames.add(file.getOriginalFilename());
        }
        for (File localFile : folder.listFiles()) {

            log.info(" 지우겠습니까? = {} >> {}", !requestFileNames.contains(localFile.getName()), localFile.getName());
            if (!requestFileNames.contains(localFile.getName())) {
                log.info("{} , {}", requestFileNames, localFile);
                result.add(localFile.delete());
            }
        }

        return !result.contains(false);
    }

    private List<FileDTO> uploadSaveFiles(ProBoard proBoard, List<MultipartFile> fileList, String folderName) {

        log.info(" service uploadSaveFile init {}", fileList);
        List<FileDTO> fileDTOList = new ArrayList<>();

        if (fileList == null) return null;
        for (MultipartFile imgFile : fileList) {
            if (imgFile.getSize() == 0 || imgFile.isEmpty()) return null;

            log.info(" service uploadSaveFile imgFile = {}", imgFile.getOriginalFilename());

            if (imgFile.getOriginalFilename().equals("default")) {
                String defFilePath = "\\img\\menu";
                String defFileName = "foodie_default.PNG";
                FileDTO fileDTO = new FileDTO(proBoard.getPromotionBno(),
                        0, defFilePath, defFileName, "default",
                        0L, "default", defFilePath + File.separator + defFileName);
                log.info(" service uploadSaveFile default {}", fileDTO.getFilePath() + "\\" + fileDTO.getFileName());
                fileDTOList.add(fileDTO);
                continue;
            }

            String newPath = getNewUploadPath(proBoard.getBusinessNo(), folderName);
            File file = new File(newPath, Objects.requireNonNull(imgFile.getOriginalFilename()));
            if (!file.exists()) {
                try {
                    log.info(" service uploadSaveFile new file add {}", file.getName());
                    imgFile.transferTo(file);
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
            fileDTOList.add(new FileDTO(proBoard.getPromotionBno(), file));
        }
        return fileDTOList;
    }

    private boolean saveFileInfo(List<FileDTO> fileDTOList) {
        if (fileDTOList == null) return false;
        log.info(" service saveFileInfo - {} ", fileDTOList.size());

        List<Boolean> resultList = new ArrayList<>();
        for (FileDTO fileDTO : fileDTOList) {
            resultList.add(proBoardMapper.saveFiles(fileDTO));
        }
        return !resultList.contains(false);
    }

    public List<FileDTO> selectFiles(int promotionBno, String type) {
        return proBoardMapper.selectFiles(promotionBno, type);
    }

    /* ===================================== notice ===================================== */

    public List<NoticeDTO> selectNotice(int promotionBno) {
        return proBoardMapper.selectNotice(promotionBno);
    }

    public boolean saveNotice(NoticeDTO noticeDTO) {
        return proBoardMapper.saveNotice(noticeDTO);
    }

    public boolean deleteNotice(int noticeNo) {
        return proBoardMapper.deleteNotice(noticeNo);
    }

    /* ===================================== menu ===================================== */
    public List<MenuDTO> selectMenuInfo(int promotionBno) {
        return proBoardMapper.selectMenuInfo(promotionBno);
    }


    private void saveMenuList(ProBoard proBoard, List<String[]> menuList, List<MultipartFile> menuFileList) {
        log.info(" service saveMenuList - {}", menuList);

        if (!menuList.get(0)[0].isEmpty()) {
            List<FileDTO> menuFileDTOs = uploadSaveFiles(proBoard, menuFileList, "menu");

            for (int i = 0; i < menuList.get(0).length; i++) {

                MenuDTO menuDTO = new MenuDTO();
                menuDTO.setPromotionBno(proBoard.getPromotionBno());
                menuDTO.setMenuName(menuList.get(0)[i]);
                menuDTO.setMenuPrice(Integer.parseInt(menuList.get(1)[i]));
                proBoardMapper.saveMenuInfo(menuDTO);

                proBoardMapper.saveFiles(menuFileDTOs.get(i));
            }
        }
    }

    /* ===================================== favorite ===================================== */

    public boolean addFavoriteStore(String email, int promotionBno) {
        return proBoardMapper.addFavoriteStore(email, promotionBno);
    }

    public boolean isFavoriteStore(String email, int promotionBno) {
        return proBoardMapper.isFavoriteStore(email, promotionBno) > 0;
    }

    public boolean removeFavoriteStore(String email, int promotionBno) {
        return proBoardMapper.removeFavoriteStore(email, promotionBno);
    }

    public Integer isHotDealService(String businessNo) {
        log.info("isHotDeal - {}", proBoardMapper.isHotDeal(businessNo));
        return proBoardMapper.isHotDeal(businessNo);
    }
}
