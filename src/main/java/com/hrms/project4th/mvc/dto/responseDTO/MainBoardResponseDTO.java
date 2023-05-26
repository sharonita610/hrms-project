package com.hrms.project4th.mvc.dto.responseDTO;

import com.hrms.project4th.mvc.entity.BdType;
import com.hrms.project4th.mvc.entity.Board;
import lombok.*;

import static com.hrms.project4th.mvc.dto.responseDTO.BoardListResponseDTO.makeShort;
import static com.hrms.project4th.mvc.dto.responseDTO.BoardListResponseDTO.makeStringDate;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MainBoardResponseDTO {


    //사원 번호
    private long empNo;
    //사원 이름
    private String empName;
    //게시글 번호
    private long boardNo;
    //게시글 제목
    private String bdTitle;
    //해당 게시물에 걸린 댓글수
    private long repNo;
    //게시글 타입(공지,자유,익명)
    private BdType bdType;
    //게시글 작성 시간
    private String bdDate;
    // 댓글 수
    private long replyNo;
    //important 값
    private long important;


    public MainBoardResponseDTO(Board board) {
        this.empNo = board.getEmpNo();
        this.empName = board.getEmpName();
        this.boardNo = board.getBoardNo();
        this.bdTitle =makeShort(board.getBdTitle(),15);
        this.repNo = board.getRepNo();
        this.bdType = board.getBdType();
        this.bdDate = makeStringDate(board.getBdDate());
        this.replyNo=board.getRepNo();
        this.important=board.getImportant();
    }


}
