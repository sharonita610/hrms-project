package com.hrms.project4th.mvc.dto.Page;

import lombok.*;

@Setter
@Getter
@ToString
public class BoardSearch extends BoardPage{
    private String boardKeyWord;
    private String boardType;

    public BoardSearch() {
        this.boardKeyWord = "";
        this.boardType = "";
    }



}
