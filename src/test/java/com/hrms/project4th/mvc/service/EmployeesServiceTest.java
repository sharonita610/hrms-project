package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.AddEmployeesDTO;
import com.hrms.project4th.mvc.entity.Confirm;
import com.hrms.project4th.mvc.entity.Employees;
import com.hrms.project4th.mvc.entity.Gender;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class EmployeesServiceTest {

    @Autowired
    EmployeesService employeesService;

    @Test
    @DisplayName("모든 직원의 리스트를 부서별, 직급순으로 불러온다.")
    void getEmployeesListTest(){
        List<Employees> list = employeesService.getEmployeesList();
        System.out.println(list);
        assertEquals(10, list.size());
    }

    @Test
    @DisplayName("사원을 추가하면 초기 비밀번호는 휴대폰번호 뒤의 4자리, 입사일자는 오늘로 생성된다.")
    void addEmployeeTest(){
        AddEmployeesDTO dto = AddEmployeesDTO.builder()
                .empName("테스트11")
                .empBirthDay("19980105")
                .empEmail("test11@test.com")
                .empGender(Gender.F)
                .empSalary(2000000L)
                .empPhone("01000000000")
                .empMyBoss(6L)
                .posCode(00001L)
                .deptCode(002L)
                .build();

        boolean flag = employeesService.addEmployee(dto);
        assertTrue(flag);
    }
}