package com.hrms.project4th.mvc.dto.page;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MailPageMaker {

    private boolean prev, next;
    private final int PAGE_LEN = 3;
    private int start, end, final_page;
    private MailPage mailPage;
    private int MailPageCount;


    public MailPageMaker(MailPage mailPage, int pageCount) {
        this.mailPage=mailPage;
        this.MailPageCount=pageCount;
        pageInfo();
    }

    private void pageInfo() {
        // EX) (1 2 3 4 5) 현재 내가 있는 페이지가 3이다
        // start는 3/5 0.xx ->CEIL-> 1 -> 1*5=>end end 에서 PAGE_LEN 을 빼고+1하면 start

        this.end = (int) Math.ceil((double)mailPage.getMailPageNo() / PAGE_LEN) * PAGE_LEN;
        this.start = end - PAGE_LEN + 1;


        // 게시글수 123개 한페이지에 10개 -> 몇개의 페이지? 13페이지
        this.final_page = (int) Math.ceil((double)this.MailPageCount/ mailPage.getMailAmount());


        if (this.end > final_page) {
            this.end = final_page;
        }

        this.prev =start > 1;
        this.next = this.final_page > end;
    }
}
