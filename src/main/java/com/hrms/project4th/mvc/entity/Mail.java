package com.hrms.project4th.mvc.entity;

import lombok.*;

import static com.hrms.project4th.mvc.entity.CheckStatus.*;
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

    //보낸 사람이메일
    private Long mailFrom;
    //받을사람 이메일
    private Long mailTo;
    //메일 제목
    private String mailTitle;
    //메일 내용
    private String mailContent;
    //메일 상태
    private CheckStatus mailStatus;

}
