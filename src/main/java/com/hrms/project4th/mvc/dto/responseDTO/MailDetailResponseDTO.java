package com.hrms.project4th.mvc.dto.responseDTO;

import lombok.*;

import java.time.LocalDate;


@Getter
@Builder
@Setter
@EqualsAndHashCode
@ToString
public class MailDetailResponseDTO {

    //보낸 사람 사번
    private Long senderEmpNo;
    //보낸 사람이메일
    private String senderEmail;;
    //보낸 사람 직책
    private String senderRoleName;
    //보낸 사람 부서
    private Long senderDeptName;
    //받는사람 사번
    private Long receiverEmpNo;
    // 받는사람 이메일
    private String receiverEmail;
    //받는사람 직책
    private String receiverRoleName;
    //받는사람 부서
    private String receiverDeptName;
    //메일 제목
    private String mailTitle;
    //메일 내용
    private String mailContent;
    //메일 작성시간(발송시간)
    private LocalDate mailDate;

}
