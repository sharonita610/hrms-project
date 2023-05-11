package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.repository.EmployeesMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmployeesService {

    private final EmployeesMapper employeesMapper;
}
