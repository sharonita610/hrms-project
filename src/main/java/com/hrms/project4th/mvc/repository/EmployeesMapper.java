package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.AutoLoginDTO;
import com.hrms.project4th.mvc.dto.responseDTO.DeptBossDTO;
import com.hrms.project4th.mvc.dto.responseDTO.EmployeeDetailResponseDTO;
import com.hrms.project4th.mvc.entity.Employees;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface  EmployeesMapper {

    List<EmployeeDetailResponseDTO> getDetailEmployeesList();
    List<Employees> getEmployeesList();

    boolean addEmployee(Employees emp);

    boolean removeEmployee(long empNo);

    boolean modifyEmployees(Employees emp);

    DeptBossDTO getDeptBoss(String deptCode);

    Employees findEmployee(long empNo);

    // 자동로그인 관련 속성 추가 기능
    void saveAutoLogin(AutoLoginDTO dto);
}
