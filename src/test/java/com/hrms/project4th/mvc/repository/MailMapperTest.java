package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.MailSendRequestDTO;
import com.hrms.project4th.mvc.entity.CheckStatus;
import com.hrms.project4th.mvc.entity.Mail;
import com.hrms.project4th.mvc.service.MailService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static com.hrms.project4th.mvc.entity.CheckStatus.*;
import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MailMapperTest {

    @Autowired
    MailMapper mailMapper;
    @Test
    @DisplayName("seongjun이메일이 jiseung이메일로 메일을 보내면 저장이되어야한다")
    void saveTest(){
        //given

        for (int i = 0; i <300; i++) {
            Mail build = Mail.builder().mailTo((long) i).
                    mailFrom((long) i).mailContent("테스트용메일"+i).mailTitle("테스트용"+i).build();
            mailMapper.sendRequest(build);
        }
    }

    @Test
    @DisplayName("mailTo가 2번인 사원의 모든 메일리스트의 사이즈가 300 이어야한다")
    void getListTest(){
        List<Mail> mailList = mailMapper.getMailList(2L);

        assertEquals(1, mailList.size(), "mailList array size should be 300");
    }

    @Test
    @DisplayName("mainNo가 2번인 메일의 내용은 테스트용메일1이어야한다")
    void getMailDetailTest(){
        Mail foundmail = mailMapper.getMailDetail(2L);

        assertEquals("테스트용메일1", foundmail.getMailContent());
    }

//    @Test
//    @DisplayName("mailNo가 2번인 내용을 조회하면 메일의 상태값이 y로 변경되어야한다")
//    void MailViewUpdateTest(){
//        Mail foundmail = mailMapper.getMailDetail(2L);
//        System.out.println("foundmail = " + foundmail);
//        //assertEquals(Y, foundmail.getMailStatus());
//
//    }
}