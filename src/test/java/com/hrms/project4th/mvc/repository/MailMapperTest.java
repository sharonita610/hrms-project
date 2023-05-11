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
            Mail build = Mail.builder().mailTo("jiseung@naver.com").
                    mailFrom("abcd@naver.com").mailContent("테스트용메일"+i).mailTitle("테스트용"+i).empNo(2L).build();
            mailMapper.sendRequest(build);
        }
    }

    @Test
    @DisplayName("empNo가 2번인 사원의 모든 메일리스트의 사이즈가 300 이어야한다")
    void getListTest(){
        List<Mail> mailList = mailMapper.getMailList(2L);

        assertEquals(300, mailList.size(), "mailList array size should be 301");
    }
}