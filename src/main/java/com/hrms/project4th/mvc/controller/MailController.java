package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.dto.MailResponseDTO;
import com.hrms.project4th.mvc.entity.Mail;
import com.hrms.project4th.mvc.service.MailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import java.util.List;

@Controller

@RequiredArgsConstructor
@Slf4j
public class MailController {

    private final MailService mailService;

    //메일 작성용 화면 요청 함수

    public String writeRequest(){
        return "";
    }

    //메일저장서비스

    public String sendRequest(final Mail mail){

        mailService.sendRequest(mail);
        return "";
    }

    //메일 불러오기서비스(로그인한 사용자 사번이 필요함)
    public String getList(Model model,@Param(value = "mailTo") Long empNo){

        List<MailResponseDTO> mailList = mailService.getMailList(empNo);
        model.addAttribute("maillist",mailList);
        return "";

    }

    //메일 하나확인하기(개개인 메일의 번호가필요함)
    public Mail getMailDetail(Model model,Long mailNo){
        return mailService.getMailDetail(mailNo);
    }

}
