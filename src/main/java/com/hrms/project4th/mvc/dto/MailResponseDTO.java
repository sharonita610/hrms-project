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

    //보낸 사람이메일
    private String empEmail;

    //보낸 사람 이름
    private String empName;

    // 보낸사람 직책코드
    private Long roleCode;

    //보낸 사람 부서
    private Long deptCode;
//
    //메일 제목
    private String mailTitle;
//
//    메일 읽음 여부
    private CheckStatus mailStatus;

    //메일 작성시간(발송시간)
    private LocalDate mailDate;




}
