package com.hrms.project4th.mvc.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Builder
@Setter
public class MailSendRequestDTO {

    //받는 사람 이메일
    private String mailTo;

    //보낸 사람 이메일
    private String mailFrom;

    //메일 제목
    private String mailTitle;

    //메일 내용
    private String mailContent;

    //사원번호
    private Long empNo;


}
