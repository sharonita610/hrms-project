package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.MailSendRequestDTO;
import com.hrms.project4th.mvc.entity.Mail;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MailMapper {
    //메일 저장
    boolean sendRequest(Mail mail);

    //메일 리스트 받아오기

    List<Mail> getMailList(Long empNo);

    //메일 상세보기
    Mail getMailDetail();

    //메일 상태값 변경
    boolean StatusMail(Long empNo);

}
