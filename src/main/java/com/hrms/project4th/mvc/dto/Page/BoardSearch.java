package com.hrms.project4th.mvc.dto.Page;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Builder
public class BoardSearch {
    private String boardKeyWord;
    private String boardType;

    public BoardSearch() {
        this.boardKeyWord = "";
        this.boardType = "";
    }
}
