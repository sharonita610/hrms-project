package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.entity.BoardEmpInfo;
import com.hrms.project4th.mvc.entity.Employees;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class BoardEmpInfoMapperTest {

    @Autowired
    BoardEmpInfoMapper boardEmpInfoMapper;

    @Test
    @DisplayName("HR_EMPLOYEES의 정보 전부 가져오기")
    void showAllInfo(){

        List<BoardEmpInfo> e = boardEmpInfoMapper.showAllInfo();
        System.out.println(e);


    }


}