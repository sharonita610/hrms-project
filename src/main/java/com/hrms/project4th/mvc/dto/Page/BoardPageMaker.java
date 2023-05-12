package com.hrms.project4th.mvc.dto.Page;

public class BoardPageMaker {

    private boolean prev, next;
    private final int PAGE_LEN = 5;
    private int start, end, final_page;
    private BoardPage boardPage;

    public BoardPageMaker(BoardPage boardPage) {

        // 게시글수 123개 한페이지에 10개 -> 몇개의 페이지? 13페이지
        this.end= boardPage.getBoardAmount();


    }


}
