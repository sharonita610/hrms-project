package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.service.EmployeesService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/employees")
public class EmployeesController {

    private final EmployeesService employeesService;

    @GetMapping("/list")
    public String getEmployeesList(){
        employeesService.getEmployeesList();
        return "";
    }

    @GetMapping("/add")
    public String addEmployee(){
        return ""; //jsp
    }

//    @PostMapping("/add")
//    public


}
