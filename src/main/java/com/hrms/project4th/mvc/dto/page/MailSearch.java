package com.hrms.project4th.mvc.dto.page;

import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
public class MailSearch extends MailPage{

    //나에게 온 메일 or 내가 보낸메일
    //default 값 나에게 온 메일
    private String mailType;

    public MailSearch() {
        this.mailType = "mailto";
    }

}
