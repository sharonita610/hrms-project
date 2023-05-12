package com.hrms.project4th.mvc.dto.Page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardPage{

    private int boardAmount;

    private int boardPageNo;

    public BoardPage(){
        boardAmount=10;
        boardPageNo=1;

    }



    public BoardPage(int boardPageNo){
        this.boardPageNo=boardPageNo;
    }

    public int getPageNum() {
        return (boardPageNo-1)*boardAmount;
    }
}
