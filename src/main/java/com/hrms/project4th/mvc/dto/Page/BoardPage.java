package com.hrms.project4th.mvc.dto.Page;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class BoardPage{

    private int boardAmount;

    private int boardPageNo;

    public BoardPage(){
        boardAmount=5;
        boardPageNo=1;

    }


    public void setBoardAmount(int boardAmount) {
        this.boardAmount = boardAmount;
    }

    public void setBoardPageNo(int boardPageNo) {
        this.boardPageNo = boardPageNo;
    }

    public int getPageLimitNum() {

        return (boardPageNo-1)*boardAmount;
    }
}
