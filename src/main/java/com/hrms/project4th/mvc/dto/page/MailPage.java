package com.hrms.project4th.mvc.dto.page;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class MailPage {

    //메일 한페이지 양
    private int MailAmount;

    //메일 페이지 양
    private int MailPageNo;

    //디폴트값 한페이지에 10개
    public MailPage(){
        MailAmount=10;
        MailPageNo=1;
    }


    public void setMailAmount(int mailAmount) {
        this.MailAmount = MailAmount;
    }

    public void setMailPageNo(int MailPageNo) {
        this.MailPageNo = MailPageNo;
    }

    public int getPageLimitNum() {

        return (MailPageNo-1)*MailAmount;
    }
}
