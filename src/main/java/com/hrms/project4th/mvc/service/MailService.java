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
    public List<Mail> getMailList(Long millTo){
        return mailMapper.getMailList(millTo);
    }

    //특정 메일읽기 (메일상세보기) (메일의 번호가 필요함!)
    public Mail getMailDetail(Long mailNo) {
        //메일을 상세보기했으니 조회함(y)로 변경되어야한다
        mailMapper.mailViewUpdate(mailNo);
        return mailMapper.getMailDetail(mailNo);
    }
}
