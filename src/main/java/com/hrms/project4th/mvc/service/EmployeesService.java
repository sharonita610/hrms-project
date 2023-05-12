package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.AddEmployeesDTO;
import com.hrms.project4th.mvc.entity.Employees;
import com.hrms.project4th.mvc.repository.EmployeesMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmployeesService {

    private final EmployeesMapper employeesMapper;

    public List<Employees> getEmployeesList() {
       return employeesMapper.getEmployeesList();
    }

    public boolean addEmployee(AddEmployeesDTO dto) {
        Employees emp = new Employees(dto);
        return employeesMapper.addEmployee(emp);
    }

    public boolean removeEmployee(long empNo){
        return employeesMapper.removeEmployee(empNo);
    }
}
