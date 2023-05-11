package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.MailSendRequestDTO;
import com.hrms.project4th.mvc.entity.Mail;
import com.hrms.project4th.mvc.repository.MailMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MailService {

    private final MailMapper mailMapper;

    //메일저장
    public void sendRequest(Mail mail){

        mailMapper.sendRequest(mail);

    }

    //메일 리스트가져오기
    public List<Mail> getMailList(Long empNo){
        return mailMapper.getMailList(empNo);
    }
}
