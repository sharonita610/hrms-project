package com.hrms.project4th.mvc.dto;

import com.hrms.project4th.mvc.entity.CheckStatus;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

import static com.hrms.project4th.mvc.entity.CheckStatus.N;

@Getter
@Builder
@Setter
@EqualsAndHashCode
public class MailResponseDTO {

    //메일 번호
    private Long mailNo;
    //보낸 사람이메일
    private String empEmail;
    //메일 제목
    private String mailTitle;
    //메일 읽음 여부
    private CheckStatus status;
    //메일 작성시간(발송시간)
    private LocalDate mailDate;

}
