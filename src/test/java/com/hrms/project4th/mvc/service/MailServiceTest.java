package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.page.MailSearch;
import com.hrms.project4th.mvc.dto.responseDTO.MailDetailResponseDTO;
import com.hrms.project4th.mvc.entity.Mail;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MailServiceTest {

    @Autowired
    MailService mailService;

//    @Test
//    void mailViewUpdateTest(){
//        List<GetMailDetailResponseDTO> mailDetail = mailService.getMailDetail(1L);
//
//        boolean b = mailDetail.getMailStatus().toString().charAt(0) == 'Y';
//
//        if (b){
//            System.out.println("b = " + b);
//        }
//    }

    @Test
    @DisplayName("메일 번호가 11번인 메일의 상세정보가 나와야한다")
    void getmailDetail(){
        MailSearch search = new MailSearch();
        MailDetailResponseDTO mailDetail = mailService.getMailDetail(11L, search);

        System.out.println(mailDetail);
    }
}