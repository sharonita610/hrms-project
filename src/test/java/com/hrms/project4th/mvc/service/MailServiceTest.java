package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.responseDTO.MailDetailResponseDTO;
import com.hrms.project4th.mvc.entity.Mail;
import org.junit.jupiter.api.Assertions;
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
}