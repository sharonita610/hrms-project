package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.AutoLoginDTO;
import com.hrms.project4th.mvc.dto.requestDTO.MyBossRequestDTO;
import com.hrms.project4th.mvc.dto.requestDTO.VerificateEmpPasswordRequestDTO;
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

    List<Employees> getMyBossNames(MyBossRequestDTO dto);

    boolean isDuplicated(String email);

    Employees findEmployee(String empEmail);
    Employees checkSession(String empSession);

    // 자동로그인 관련 속성 추가 기능
    void saveAutoLogin(AutoLoginDTO dto);

    // 사원 번호 바꾸는 mapper
    boolean updatePhoneNumber(String empEmail, String newPhone);

    boolean modifyEmployeesWithNoProfile(Employees emp);

    List<EmployeeDetailResponseDTO> getDetailEmployeesListByDept(String deptCode);

    List<EmployeeDetailResponseDTO> getDeptHeadList();

    EmployeeDetailResponseDTO getDetailedEmployee(long empNo);

    List<EmployeeDetailResponseDTO> searchEmployeesByName(String empName);

    EmployeeDetailResponseDTO logedInDetail(String empEmail);

    Employees verificateEmp(VerificateEmpPasswordRequestDTO dto);
}
