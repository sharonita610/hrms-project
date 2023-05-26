package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class MailControllerTest {

    @Autowired
    MailService mailService;
    void pageMakerTest(){
//        MailPage page =new MailSearch();
//        MailPageMaker mailPageMaker = new MailPageMaker(page,mailService.getMailPageCountByStatus(2L, CheckStatus.Y));
//
//        System.out.println(mailPageMaker.toString());
    }
}