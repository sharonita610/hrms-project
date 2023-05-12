package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.entity.Mail;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MailServiceTest {

    @Autowired
    MailService mailService;

//    @Test
//    void mailViewUpdateTest(){
//        Mail mailDetail = mailService.getMailDetail(2L);
//
//        boolean b = mailDetail.getMailStatus().toString().charAt(0) == 'Y';
//
//        if (b){
//            System.out.println("b = " + b);
//        }
//    }
}