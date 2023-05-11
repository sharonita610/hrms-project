package com.hrms.project4th.mvc.entity;

import java.time.LocalDate;

public class Email {

    //메일 번호 pk
    private Long mailNo;

    //받을사람 사번
    private Long mailTo;

    //보낸 사람 사번
    private Long mailFrom;

    //메일 제목
    private String mailTitle;

    //메일 내용
    private String mailContent;

    //메일 작성일자
    private LocalDate mailDate;

    //메일 상태( Y : 읽음 / N : 안읽음)
    //열거형
    private CheckStatus mailStatus;

}
