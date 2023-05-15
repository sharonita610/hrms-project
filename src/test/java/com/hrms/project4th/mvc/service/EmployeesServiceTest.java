package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.AddEmployeesDTO;
import com.hrms.project4th.mvc.dto.ModifyEmployeeDTO;
import com.hrms.project4th.mvc.entity.Confirm;
import com.hrms.project4th.mvc.entity.Employees;
import com.hrms.project4th.mvc.entity.Gender;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.lang.annotation.Documented;
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
                .empPhone("01000005555")
                .empMyBoss(6L)
                .posCode("00001")
                .deptCode("002")
                .build();

        boolean flag = employeesService.addEmployee(dto);
        assertTrue(flag);
    }

    @Test
    @DisplayName("사원번호로 사원을 삭제할 수 있다")
    public void removeEmployeeTest(){
        long empNo = 14L;
        boolean flag = employeesService.removeEmployee(empNo);

        assertTrue(flag);
    }

    @Test
    @DisplayName("사원 정보를 수정할 수 있다")
    public void modifyEmployeesTest(){
        ModifyEmployeeDTO emp = ModifyEmployeeDTO.builder()
                .empNo(1L)
                .empEmail("modifyTest@email.com")
                .empPassword("1111")
                .empSalary(22300000L)
                .empPhone("01001001113")
                .empMyBoss(6L)
                .posCode("3")
                .roleCode("00000")
                .deptCode("001")
                .build();

        boolean flag = employeesService.modifyEmployees(emp);

        assertTrue(flag);
    }
}