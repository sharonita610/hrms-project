package com.hrms.project4th.mvc.dto.page;

public class MainPageMaker {
    private BoardPage boardPage;
    private final int PAGE_LEN = 5;
    private boolean prev, next;
    private int start, end, final_page;
    private int boardPageCount;

    public MainPageMaker() {


        this.end = (int) Math.ceil((double) boardPage.getBoardPageNo() / PAGE_LEN) * PAGE_LEN;
        this.start = end - PAGE_LEN + 1;

        this.final_page = (int) Math.ceil((double) this.boardPageCount / boardPage.getBoardAmount());

        if (this.end > final_page) {
            this.end = final_page;
        }

        this.prev = start > 1;
        this.next = this.final_page > end;


    }


}
