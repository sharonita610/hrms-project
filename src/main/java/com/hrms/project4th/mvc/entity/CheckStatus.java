package com.hrms.project4th.mvc.entity;

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
