package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.entity.HrEmployees;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class HrEmployeesMapperTest {

    @Autowired
    HrEmployeesMapper hrEmployeesMapper;

    @Test
    @DisplayName("전체 조회")
    void findAll(){
        List<HrEmployees> all = hrEmployeesMapper.findAll();
        System.out.println("all = " + all);

    }

}