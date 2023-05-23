package com.hrms.project4th.mvc.dto.responseDTO;

import com.hrms.project4th.mvc.entity.CheckStatus;
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
    //보낸 사람 이메일
    private String senderEmail;

    //받는사람 사번
    private Long receiverEmpNo;
    // 받는사람 이름
    private String receiverName;
    //받는사람 부서이름
    private String receiverEmail;
    //받는사람 직급이름
    private String posName;
    //받는사람 부서이름
    private String receiverDeptName;
    //메일 제목
    private String mailTitle;
    //메일 내용
    private String mailContent;
    //메일 작성시간(발송시간)
    private LocalDate mailDate;

//    //메일 상태
//    private CheckStatus mailStatus;
}
