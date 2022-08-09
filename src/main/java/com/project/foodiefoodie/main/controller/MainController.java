package com.project.foodiefoodie.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/map")
    public String mainPage() {
        return "html/index";
    }
}
