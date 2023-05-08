package com.hrms.project4th.mvc.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.stereotype.Controller
@RequestMapping("/hr")
class Controller {

    @GetMapping("/list")
    public String test(){

        return "list";
    }

}
