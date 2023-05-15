package com.hrms.project4th.mvc.dto.requestDTO;

import com.hrms.project4th.mvc.dto.responseDTO.BoardListResponseDTO;
import com.hrms.project4th.mvc.entity.Board;
import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class BoardDetailRequestDTO {


    private long boardNo;
    private String bdType;
    private String bdTitle;
    private String bdContent;
    private String stringDate;
    private long empNo;

    public BoardDetailRequestDTO(Board board){
        this.boardNo = board.getBoardNo();
        this.bdType = String.valueOf(board.getBdType());
        this.bdTitle = board.getBdTitle();
        this.bdContent = board.getBdContent();
        this.stringDate= BoardListResponseDTO.makeStringDate(board.getBdDate());
        this.empNo = (int)Math.ceil(Math.random()*100);

    }



}
