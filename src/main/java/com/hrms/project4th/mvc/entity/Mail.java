package com.hrms.project4th.mvc.entity;

import com.hrms.project4th.mvc.dto.MailSendRequestDTO;
import lombok.*;

import java.time.LocalDate;
//
//-- 메일 테이블
//        create table HR_EMAIL(
//        MAIL_NO INT(3) auto_increment,
//        MAIL_TO VARCHAR(50),
//        MAIL_FROM VARCHAR(50),
//        MAIL_TITLE VARCHAR(100) not null,
//        MAIL_CONTENT VARCHAR(1000)not null,
//        MAIL_DATE DATETIME default CURRENT_TIMESTAMP,
//        MAIL_STATUS CHAR(1),
//        EMP_NO INT(10),
//        constraint PK_MAIL_NO primary key (MAIL_NO)
//        );

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
@EqualsAndHashCode
public class Mail {


    //메일 번호 pk
    private Long mailNo;

    //받을사람 이메일
    private String mailTo;

    //보낸 사람 이름
    private String mailFrom;

    //메일 제목
    private String mailTitle;

    //메일 내용
    private String mailContent;

    //메일 작성일자
    private LocalDate mailDate;

    //메일 상태( Y : 읽음 / N : 안읽음)
    //열거형
    private CheckStatus mailStatus;

    //사원 번호 fk(참조키)
    private Long empNo;


}
