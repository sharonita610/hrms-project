package com.hrms.project4th.mvc.dto.requestDTO;

import com.hrms.project4th.mvc.entity.BoardReply;
import lombok.Getter;
import lombok.Setter;
import lombok.Singular;
import lombok.ToString;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Setter
@ToString
@Getter
public class BoardReplyWriteRequestDTO {
    //게시글 번호

    private long boardNo;

    // 댓글 내용
    @NotBlank
    private String repContent;

    // 작성자의 사원 번호
    private long empNo;


    public BoardReply changeEntity() {
        return BoardReply.builder()
                .boardNo(this.boardNo)
                .empNo(this.empNo)
                .repContent(this.repContent)
                .build();
    }



}
