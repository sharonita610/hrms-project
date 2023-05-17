package com.hrms.project4th.mvc.dto.Page;

import lombok.*;

@Setter
@Getter
public class BoardSearch extends BoardPage{
    private String boardKeyWord;
    private String boardType;

    public BoardSearch() {
        this.boardKeyWord = "";
        this.boardType = "";
    }

    @Override
    public String toString() {
        return "BoardSearch{" +
                "boardPage=" + super.toString() +
                ",boardKeyWord='" + boardKeyWord + '\'' +
                ", boardType='" + boardType + '\'' +
                '}';
    }
}
