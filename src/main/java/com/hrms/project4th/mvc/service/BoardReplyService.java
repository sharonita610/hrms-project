package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.requestDTO.BoarReplyDeleteRequestDTO;
import com.hrms.project4th.mvc.dto.responseDTO.BoardReplyDetailResponseDTO;
import com.hrms.project4th.mvc.dto.responseDTO.BoardReplyListResponseDTO;
import com.hrms.project4th.mvc.dto.requestDTO.BoardReplyWriteRequestDTO;
import com.hrms.project4th.mvc.dto.Page.BoardPage;
import com.hrms.project4th.mvc.dto.Page.BoardPageMaker;
import com.hrms.project4th.mvc.entity.BoardReply;
import com.hrms.project4th.mvc.repository.BoardReplyMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.sql.SQLDataException;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardReplyService {
    private final BoardReplyMapper boardReplyMapper;

    // 게시판 댓글 목록 조회
    public BoardReplyListResponseDTO findAll(long boardNo, BoardPage page) {
        List<BoardReplyDetailResponseDTO> boardReplyList
                = boardReplyMapper.findAll(boardNo, page)
                .stream().map(BoardReplyDetailResponseDTO::new)
                .collect(Collectors.toList());

        return BoardReplyListResponseDTO.builder()
                .replyCount(boardReplyMapper.countReply(boardNo))
                .boardReplyPageMaker(new BoardPageMaker(page, boardReplyMapper.countReply(boardNo)))
                .boardReplies(boardReplyList)
                .build();

    }

    public boolean save(BoardReplyWriteRequestDTO dto) throws SQLDataException {
        BoardReply boardReply = dto.changeEntity();

        boolean flag = boardReplyMapper.save(boardReply);
        if (!flag) {
            log.warn("fail to save Reply");
            throw new SQLDataException("fail to save Reply");
        }
        return flag;
    }

    public boolean delete(BoarReplyDeleteRequestDTO dto) throws SQLDataException {

        BoardReply boardReply = dto.changeEntity();

        boolean flag = boardReplyMapper.delete(boardReply);
        if(!flag){
            log.warn("fila to delete Reply");
            throw new SQLDataException("fila to delete Reply");
        }
        return flag;


    }
}
