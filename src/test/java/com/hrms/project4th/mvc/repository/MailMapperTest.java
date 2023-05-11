package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.MailSendRequestDTO;
import com.hrms.project4th.mvc.entity.CheckStatus;
import com.hrms.project4th.mvc.entity.Mail;
import com.hrms.project4th.mvc.service.MailService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

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


        Mail build = Mail.builder().mailTo("jiseung@naver.com").
                mailFrom("abcd@naver.com").mailContent("테스트용메일").mailTitle("테스트용").empNo(2L).mailStatus(N).build();
        mailMapper.sendRequest(build);
    }
}