package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.dto.Page.MailPage;
import com.hrms.project4th.mvc.dto.Page.MailPageMaker;
import com.hrms.project4th.mvc.dto.Page.MailSearch;
import com.hrms.project4th.mvc.entity.CheckStatus;
import com.hrms.project4th.mvc.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

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