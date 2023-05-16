package com.hrms.project4th.mvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MainPageController {

    @GetMapping("/main")
    public String mainPage(){

        log.info("/main : GET 요청!");

        return "/main/main-page";
    }
    @GetMapping("/index")
    public String loginPage(){

        log.info("/index : GET 요청!");

        return "/index";
    }
}
