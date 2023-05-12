package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.entity.Mail;
import org.apache.ibatis.annotations.ConstructorArgs;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Configuration;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MailMapperTest {
    @Autowired
    MailMapper mailMapper;


   @Test
   @DisplayName("사원번호가 2번인 사람의 메일을 300개 저장한다")
    void saveMailTest(){
       Mail.builder().mailTitle().build();
   }


}