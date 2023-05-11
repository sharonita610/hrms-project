package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.service.EmployeesService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
@Slf4j
public class EmployeesController {

    private final EmployeesService employeesService;
}
