package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.entity.Employees;
import com.hrms.project4th.mvc.entity.Gender;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ClubControllerTest {

    @Test
    void test(){
        Employees exEmp = Employees.builder()
                .empNo(1L)
                .empName("홍길동")
                .empEmail("1@test.com")
                .empPassword("1234")
                .empGender(Gender.M)
                .build();

        System.out.println(exEmp);
    }

}