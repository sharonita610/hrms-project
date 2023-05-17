package com.hrms.project4th.mvc.dto.Page;

import lombok.*;

@Getter
@Setter

@AllArgsConstructor
@Builder
public class BoardPage{

    private int boardAmount;

    private int boardPageNo;

    public BoardPage(){
        boardAmount=10;
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

    @Override
    public String toString() {
        return "BoardPage{" +
                "boardAmount=" + boardAmount +
                ", boardPageNo=" + boardPageNo +
                '}';
    }
}
