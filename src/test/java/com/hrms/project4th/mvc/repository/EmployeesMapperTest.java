package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.AutoLoginDTO;
import com.hrms.project4th.mvc.dto.requestDTO.VerificateEmpPasswordRequestDTO;
import com.hrms.project4th.mvc.dto.responseDTO.DeptBossDTO;
import com.hrms.project4th.mvc.dto.responseDTO.EmployeeDetailResponseDTO;
import com.hrms.project4th.mvc.entity.Employees;
import com.hrms.project4th.mvc.service.EmployeesService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

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
    @DisplayName("사원의 이메일을 입력하면 이름을 리턴한다.")
    public void findEmployeeTest(){
        // given


        Employees emp = employeesMapper.findEmployee("one@samjosangsa.com");
        System.out.println("emp = " + emp.getEmpName());

        assertEquals("김일번",emp.getEmpName());
    }


//    @Test
//    @DisplayName("2번 사원의 휴대폰 번로를 변경한다.")
//    public void updatePhoneNumberTest() {
//        // given
//        String mail = "two@samjosangsa.com";
//        String s = "02-2222-2222";
//
//
//        boolean b = employeesMapper.updatePhoneNumber(mail, s);
//
//        assertTrue(b);
//
//
//    }
    @Test
    @DisplayName("이름을 입력하면 사원의 정보가 나와야한다")
    void getemployeesTest(){
        List<EmployeeDetailResponseDTO> employees = employeesMapper.searchEmployeesByName("김영희");
        System.out.println(employees);
    }

//    @Test
//    @DisplayName("2번 사원의 이름, 이메일, 생일, 급여를 입력하면 1명이 조회되어야한다")
//    public void verificateEmpTest(){
//        // given
//        VerificateEmpPasswordRequestDTO dto = new VerificateEmpPasswordRequestDTO();
//        dto.setEmpNo("2");
//        dto.setEmpName("김영희");
//        dto.setEmpBirthDay("1988-05-10");
//        dto.setEmpSalary( "2500000");
//        dto.setEmpEmail("kim@samjosangsa.com");
//
//
//        // when
//        Employees t = employeesMapper.verificateEmp(dto);
//
//        // then
//        assertEquals("김영희", t.getEmpName());
//
//    }

    @Test
    @DisplayName("sessionID 를 주면 admin@samjosangsa.com 이 나와야한다")
    void checkSessionTest(){
        AutoLoginDTO dto = new AutoLoginDTO();
        dto.setEmpSession("86AC42D89FD0218164FD6FF4D546B56E");

        Employees r = employeesMapper.checkSession(dto.getEmpSession());

        assertEquals("admin@samjosangsa.com", r.getEmpEmail());

    }


}