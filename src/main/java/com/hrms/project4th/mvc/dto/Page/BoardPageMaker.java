package com.hrms.project4th.mvc.dto.Page;

import com.hrms.project4th.mvc.entity.BdType;
import com.hrms.project4th.mvc.repository.BoardMapper;
import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class BoardPageMaker {

    private boolean prev, next;
    private final int PAGE_LEN = 10;
    private int start, end, final_page;
    private BoardPage boardPage;
    private BoardMapper boardMapper;

    public BoardPageMaker(BoardPage boardPage) {


        // EX) (1 2 3 4 5) 현재 내가 있는 페이지가 3이다
        // start는 3/5 0.xx ->CEIL -> 1 -> 1*5=>end end 에서 PAGE_LEN 을 빼고+1하면 start

        this.end=(int)Math.ceil((double)boardPage.getBoardPageNo()/PAGE_LEN)*PAGE_LEN;
        this.start=end-PAGE_LEN+1;


        // 게시글수 123개 한페이지에 10개 -> 몇개의 페이지? 13페이지
        this.final_page= (int)Math.ceil((double)boardMapper.countTypeBoard()/boardPage.getBoardAmount());


        if(this.end>final_page){
            this.end=final_page;
        }

        this.prev=boardPage.getBoardPageNo()>1;
        this.next= boardPage.getBoardPageNo()<end;


    }


}
