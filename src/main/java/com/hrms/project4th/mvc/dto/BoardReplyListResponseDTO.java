package com.hrms.project4th.mvc.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hrms.project4th.mvc.dto.Page.BoardPage;
import com.hrms.project4th.mvc.dto.Page.BoardPageMaker;
import com.hrms.project4th.mvc.entity.BoardReply;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardReplyListResponseDTO {
    @Setter
    @Getter
    @ToString
    @AllArgsConstructor
    @NoArgsConstructor
    @Builder
    public static class BoardReplyDetailResponseDTO{

        private long replyNo;
        private String replyContent;
        private long empNo;
        @JsonFormat(pattern = "yyyy년 MM월 dd일 HH:mm")
        private LocalDateTime replyRegDate;

//        private long repNo;
//        private String repContent;
//        private LocalDateTime repDate;
//        private long boardNo;
//        private long empNo;

        public BoardReplyDetailResponseDTO(BoardReply boardReply){
            this.replyNo=boardReply.getRepNo();
            this.replyContent=boardReply.getRepContent();
            this.empNo=boardReply.getEmpNo();
            this.replyRegDate=boardReply.getRepDate();

        }


    }

    //댓글수
    private int replyCount;

    //게시판 댓글 리스트
    private List<BoardReply> boardReplies;
    // 댓글 페이지 정보
    private BoardPageMaker boardReplyPageMaker;


}
