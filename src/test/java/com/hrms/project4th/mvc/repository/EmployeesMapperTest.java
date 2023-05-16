package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.responseDTO.DeptBossDTO;
import com.hrms.project4th.mvc.entity.Employees;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class EmployeesMapperTest {

    @Autowired
    EmployeesMapper employeesMapper;

    @Test
    @DisplayName("부서번호를 입력하면 부서장을 리턴한다")
    void getDeptBossTest(){
        String deptCode = "001";
        DeptBossDTO deptBoss = employeesMapper.getDeptBoss(deptCode);
        System.out.println(deptBoss);

        assertEquals("11111", deptBoss.getRoleCode());
    }

//    @Test
//    @DisplayName("")

    @Test
    @DisplayName("사원 번호를 입력하면 이름을 리턴한다.")
    public void findEmployeeTest(){
        // given


        Employees emp = employeesMapper.findEmployee(2L);
        System.out.println("emp = " + emp.getEmpName());

        assertEquals("김이번",employeesMapper.findEmployee(2L).getEmpName());
    }
}