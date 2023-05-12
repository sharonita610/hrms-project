package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.entity.Employees;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EmployeesMapper {

    List<Employees> getEmployeesList();

    boolean addEmployee(Employees emp);
}
