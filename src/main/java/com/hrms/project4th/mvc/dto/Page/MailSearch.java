package com.hrms.project4th.mvc.dto.Page;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MailSearch {

    private String mailKeyWord;
    private String mailType;

    public MailSearch() {
        this.mailKeyWord = "";
        this.mailType = "";
    }

}
