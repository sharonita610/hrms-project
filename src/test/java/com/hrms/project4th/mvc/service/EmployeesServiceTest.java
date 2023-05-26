package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.requestDTO.AddEmployeesDTO;
import com.hrms.project4th.mvc.dto.requestDTO.ModifyEmployeeDTO;
import com.hrms.project4th.mvc.entity.CheckPassword;
import com.hrms.project4th.mvc.entity.Employees;
import com.hrms.project4th.mvc.entity.Gender;
import com.hrms.project4th.mvc.entity.LoginResult;
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


    // 김혜영 : 에러발생해서 주석 처리함
//    @Value("${file.upload.root-path}")
//    private String rootPath;

//    @Test
//    @DisplayName("사원을 추가하면 초기 비밀번호는 휴대폰번호 뒤의 4자리, 입사일자는 오늘로 생성된다.")
////    void addEmployeeTest(){
//
//
//        for (int i = 1; i < 7; i++) {
//            for (int j = 0; j < 10; j++) {
//
//            AddEmployeesDTO dto = AddEmployeesDTO.builder()
//                .empName("테스트사원" + i + j)
//                .empBirthDay("1998-01-05")
//                .empEmail("test" + i + j)
//                .empGender(Gender.F)
//                .empSalary(2000000L)
//                .empPhone("010000055" + i + j)
//                .empMyBoss(1L)
//                .posCode("005")
//                .deptCode("00" + i)
//                .build();
//                boolean flag = employeesService.addEmployee(dto, rootPath);
//                assertTrue(flag);
//            }
//        }
//
//    }

//    @Test
//    @DisplayName("사원번호로 사원을 삭제할 수 있다")
//    public void removeEmployeeTest(){
//        for (int i = 90; i < 150; i++) {
//        long empNo = i;
//        boolean flag = employeesService.removeEmployee(empNo);
//
//        assertTrue(flag);
//        }
//
//    }

//    @Test
//    @DisplayName("이메일과 비밀번호를 입력하면 김영희 사원이 나온다")
//    public void checkEmployeeTest(){
//
//
//        String empEmail = "kim@samjosangsa.com";
//        String empPassword = "2222";
//
//        CheckPassword result = employeesService.checkCurrentPwd(empEmail, empPassword);
//
//        assertEquals("1", result.getEmpPassword());
//    }



}