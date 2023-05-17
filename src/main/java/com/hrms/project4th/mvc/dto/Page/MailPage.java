package com.hrms.project4th.mvc.dto.Page;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@Builder
public class MailPage {

    //메일 한페이지 양
    private int mailAmount;

    //메일 페이지 양
    private int mailPageNo;

    //디폴트값 한페이지에 10개
    public MailPage(){
        mailAmount=10;
        mailPageNo=1;
    }


    public void setMailAmount(int mailAmount) {
        this.mailAmount = mailAmount;
    }

    public void setMailPageNo(int mailPageNo) {
        this.mailPageNo = mailPageNo;
    }

    public int getPageLimitNum() {

        return (mailPageNo-1)*mailAmount;
    }
}
