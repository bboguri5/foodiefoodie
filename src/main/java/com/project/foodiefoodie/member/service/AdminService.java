package com.project.foodiefoodie.member.service;

import com.project.foodiefoodie.member.dto.AuthDTO;
import com.project.foodiefoodie.member.repository.AdminMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Log4j2
public class AdminService {

    private final AdminMapper adminMapper;


    // 권한 변경 중간 처리
    public boolean authChangeService(AuthDTO dto) {
        return adminMapper.authChange(dto);
    }
}
