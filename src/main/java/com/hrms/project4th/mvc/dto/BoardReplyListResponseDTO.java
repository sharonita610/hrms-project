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

    //댓글수
    private int replyCount;

    //게시판 댓글 리스트
    private List<BoardReplyDetailResponseDTO> boardReplies;
    // 댓글 페이지 정보
    private BoardPageMaker boardReplyPageMaker;


}
