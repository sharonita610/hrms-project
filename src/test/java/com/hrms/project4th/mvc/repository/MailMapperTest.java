package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.MailResponseDTO;
import com.hrms.project4th.mvc.dto.Page.MailSearch;
import com.hrms.project4th.mvc.entity.CheckStatus;
import com.hrms.project4th.mvc.entity.Mail;
import org.apache.ibatis.annotations.ConstructorArgs;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Configuration;

import java.sql.SQLOutput;
import java.util.List;

import static com.hrms.project4th.mvc.entity.CheckStatus.*;
import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MailMapperTest {
    @Autowired
    MailMapper mailMapper;

   @Test
   @DisplayName("사원번호가 n번인 사람의 메일을 n+1번사원에게 전송한다")
    void saveMailTest(){

       for (int i =1; i<=10; i++) {
//           Mail mailTest = Mail.builder().mailTitle("테스트용메일"+i).mailContent("테스트용메일입니다"+i).mailFrom(8L).mailTo(10L).build();

           Mail mailTest = Mail.builder().mailTitle("테스트용 메일" + i).mailContent(i + "테스트용메일입니다").mailFrom(45L).mailTo(2L).build();
           mailMapper.sendRequest(mailTest);
       }
   }


    @Test
    @DisplayName("2번사원이 보낸 메일의 개수는 71개이다")
    void getMailListTest(){
       MailSearch mailSearch = new MailSearch();
       mailSearch.setMailType("mailto");
        List<MailResponseDTO> mailList = mailMapper.getMailList(2L,mailSearch);
        for (MailResponseDTO mailResponseDTO : mailList) {
            System.out.println(mailResponseDTO);
        }
        System.out.println(mailList.size());

    }

    @Test
    @DisplayName("메일번호가 50번 번호의 제목은 테스트용 메일50이다")
    void getMailDetailTest(){
        Mail mailDetail = mailMapper.getMailDetail(50L);
        System.out.println(mailDetail.toString());
    }


    @Test
    @DisplayName("사원번호 2번에게 온 메일 의 status가 y인 게시글만 조회되어야한다")
    void getMailListByStatusTest(){
       MailSearch mailSearch = new MailSearch();
        List<MailResponseDTO> mailListByStatus = mailMapper.getMailListByStatus(2L, valueOf(String.valueOf(Y)));
        System.out.println(mailListByStatus.toString());
    }





}