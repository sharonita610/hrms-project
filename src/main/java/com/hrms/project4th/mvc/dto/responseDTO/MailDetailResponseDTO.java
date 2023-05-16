package com.hrms.project4th.mvc.dto.responseDTO;

import lombok.*;

import java.time.LocalDate;


@Getter
@Builder
@Setter
@EqualsAndHashCode
@ToString
public class MailDetailResponseDTO {

    //보낸 사람이메일
    private String empEmail;

    //보낸 사람 이름
    private String empName;

    //보낸 사람 사번
    private Long empNo;

    // 보낸사람 직책코드
    private Long roleCode;

    //보낸 사람 부서
    private Long deptCode;

    //메일 제목
    private String mailTitle;
    //메일 내용
    private String mailContent;

    //메일 작성시간(발송시간)
    private LocalDate mailDate;
}
