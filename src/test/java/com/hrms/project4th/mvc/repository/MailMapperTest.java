package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.MailResponseDTO;
import com.hrms.project4th.mvc.entity.Mail;
import org.apache.ibatis.annotations.ConstructorArgs;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Configuration;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MailMapperTest {
    @Autowired
    MailMapper mailMapper;


   @Test
   @DisplayName("사원번호가 1번인 사람의 메일을 2번사원에게 전송한다")
    void saveMailTest(){
       Mail mailTest = Mail.builder().mailTitle("테스트용메일1").mailContent("테스트용").mailFrom(1L).mailTo(2L).build();

       mailMapper.sendRequest(mailTest);
   }


    @Test
    @DisplayName("사원번호가1번인 사람이 보낸 메일의 제목은 테스트용메일1이다")
    void getMailListTest(){
       List<MailResponseDTO> mailList = mailMapper.getMailList(2L);
        System.out.println(mailList.toString());
   }




}