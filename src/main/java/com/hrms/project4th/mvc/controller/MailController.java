package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.dto.MailResponseDTO;
import com.hrms.project4th.mvc.dto.page.MailPageMaker;
import com.hrms.project4th.mvc.dto.page.MailSearch;
import com.hrms.project4th.mvc.dto.responseDTO.MailDetailResponseDTO;
import com.hrms.project4th.mvc.entity.CheckStatus;
import com.hrms.project4th.mvc.entity.Mail;
import com.hrms.project4th.mvc.service.MailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/hrms")
@Slf4j
public class MailController {

    private final MailService mailService;

    //메일 작성용 화면 요청 함수
    public String writeRequest(){
        return "";
    }

    //메일저장(전송)서비스
    public String sendRequest(final Mail mail){

        mailService.sendRequest(mail);
        return "";
    }

    @GetMapping("/mail-list")
    //메일 불러오기서비스(로그인한 사용자 사번이 필요함)
    public String getList(Model model, Long empNo, MailSearch search){

        List<MailResponseDTO> mailList = mailService.getMailList(empNo,search);
        MailPageMaker mailPageMaker = new MailPageMaker(search,mailService.mailPageCount());
        model.addAttribute("mList",mailList);
        return "/mail/mail";
    }

    //메일 하나확인하기(개개인 메일의 번호가필요함)
    public String getMailDetail(Model model,Long mailNo,MailSearch search,Long empNo){
        List<MailDetailResponseDTO> mailDetail = mailService.getMailDetail(mailNo, search,empNo);
        model.addAttribute("md",mailDetail);
        return "";
    }

    //사원번호에맞는 메일 리스트리턴(상태값에 따라 구분 Y/N)
    public String getMailListByStatus(Model model, Long empNo, CheckStatus status){
        List<MailResponseDTO> mailListByStatus = mailService.getMailListByStatus(empNo, status);
        model.addAttribute("mList",mailListByStatus);
        return "";
    }

    //메일 삭제하기(사원번호에 맞는메일을 삭제해야함)
    public String MailDelteByNum(Long mailNo){
        mailService.deleteByNum(mailNo);
        return "";
    }



}
