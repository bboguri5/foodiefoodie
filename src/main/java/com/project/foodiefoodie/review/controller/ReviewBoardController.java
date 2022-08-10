package com.project.foodiefoodie.review.controller;

import com.project.foodiefoodie.review.service.ReviewBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;

@Controller
@Log4j2
@RequiredArgsConstructor
public class ReviewBoardController {

    private final ReviewBoardService service;


}
