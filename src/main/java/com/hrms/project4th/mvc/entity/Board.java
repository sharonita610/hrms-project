package com.hrms.project4th.mvc.entity;

import com.hrms.project4th.mvc.dto.requestDTO.BoardModifyRequestDTO;
import com.hrms.project4th.mvc.dto.requestDTO.BoardSaveRequestDTO;
import lombok.*;

import java.time.LocalDateTime;
@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class Board {
    //게시글 번호
    private long boardNo;

    //게시글 종료(공지,자유,익명)
    private BdType bdType;

    //게시글 제목
    private String bdTitle;

    //게시글 내용
    private String bdContent;

    //게시글 작성 시간
    private LocalDateTime bdDate;
    //게시글 조회수
    private long viewCount;

    //사원 번호
    private long empNo;
    //사원 이름
    private String empName;


    public Board(BoardSaveRequestDTO dto) {
        this.bdType=dto.getBdType();
        this.bdTitle=dto.getBdTitle();
        this.bdContent=dto.getBdContent();
        this.empNo= dto.getEmpNo();
    }

    public Board(BoardModifyRequestDTO dto){
        this.boardNo=dto.getBoardNo();
        this.bdType= BdType.valueOf(dto.getBdType());
        this.bdTitle=dto.getBdTitle();
        this.bdContent=dto.getBdContent();
//        this.empNo= dto.getEmpNo();
    }
}
