package com.hrms.project4th.mvc.entity;

import com.hrms.project4th.mvc.dto.page.MailSearch;
import lombok.Getter;

@Getter
public enum CheckStatus {
    Y("YES"),
    N("NO"),
    Z("WAIT");

    private String desc;

    CheckStatus(String desc) {
        this.desc = desc;
    }
}
