package com.project.foodiefoodie.reply.controller;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.reply.domain.Reply;
import com.project.foodiefoodie.reply.service.ReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@Log4j2
@CrossOrigin
@RequestMapping("/reply")
public class ReplyAPIController {

    private final ReplyService service;

    @GetMapping("")
    public Map<String, Object> list(Long reviewBno, Page page) {
        Map<String, Object> replies = service.getList(reviewBno, page);
        return replies;
    }

    // 댓글 등록 요청
    @PostMapping("")
    public String create(@RequestBody Reply reply, HttpSession session) {
//        reply.setEmail(LoginUtils.getCurrentMemberAccount(session));
        log.info("/reply POST! - {}", reply);
        boolean flag = service.write(reply);
        return flag ? "insert-success" : "insert-fail";
    }
}