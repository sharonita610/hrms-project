package com.hrms.project4th.mvc.dto.Page;

import com.hrms.project4th.mvc.entity.BdType;
import com.hrms.project4th.mvc.repository.BoardMapper;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardPageMaker {

    private boolean prev, next;
    private final int PAGE_LEN = 5;
    private int start, end, final_page;
    private BoardPage boardPage;
    private BoardMapper boardMapper;

    public BoardPageMaker(BoardPage boardPage, BdType bdType) {
        // EX) (1 2 3 4 5) 현재 내가 있는 페이지가 3이다
        // EX) (6 7 8 9 10) 현재 내가 있는 페이지가 9이다
        // -> start는 5/3 1.xx ->CEIL -> 2 -> 1*5=>end end 에서 PAGE_LEN 을 빼고+1하면 start




        // 게시글수 123개 한페이지에 10개 -> 몇개의 페이지? 13페이지
        this.final_page= (int)Math.ceil((double)boardMapper.countTypeBoard(bdType)/boardPage.getBoardAmount());




        this.start=end-PAGE_LEN+1;

        this.prev=boardPage.getBoardPageNo()>1;
        this.end= boardPage.getBoardPageNo()>100;


    }


}
