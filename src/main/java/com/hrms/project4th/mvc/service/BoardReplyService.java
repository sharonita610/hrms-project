package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.BoardReplyListResponseDTO;
import com.hrms.project4th.mvc.dto.Page.BoardPage;
import com.hrms.project4th.mvc.entity.BoardReply;
import com.hrms.project4th.mvc.repository.BoardReplyMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardReplyService {
    private final BoardReplyMapper boardReplyMapper;

    // 게시판 댓글 목록 조회
    public BoardReplyListResponseDTO getList(long boardNo, BoardPage page){
        List<BoardReply> boardReplyList = boardReplyMapper.findAll(boardNo, page);

        return BoardReplyListResponseDTO.builder()
                .replyCount()
                .boardReplyPageMaker()
                .boardReplies()
                .build();

    }
}
