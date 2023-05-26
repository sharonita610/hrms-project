package com.hrms.project4th.mvc.dto;

import com.hrms.project4th.mvc.entity.CheckStatus;
import lombok.*;

import java.time.LocalDate;

import static com.hrms.project4th.mvc.entity.CheckStatus.N;

@Getter
@Builder
@Setter
@EqualsAndHashCode
@ToString
public class MailResponseDTO {

    //메일 번호
    private Long mailNo;

    //메일 제목
    private String mailTitle;

    //보낸 사람 이름
    private String senderName;

    // 보낸사람 이메일
    private String senderEmail;

    //보낸사람 직책
    private String senderPosition;
//
    //보낸사람 부서
    private String senderDepartment;

    //메일 상태
    private CheckStatus mailStatus;

    //메일 발송날짜
    private LocalDate mailDate;


}
