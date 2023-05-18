package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.requestDTO.BoardReplyDeleteRequestDTO;
import com.hrms.project4th.mvc.dto.requestDTO.BoardReplyModifyRequestDTO;
import com.hrms.project4th.mvc.dto.responseDTO.BoardReplyDetailResponseDTO;
import com.hrms.project4th.mvc.dto.responseDTO.BoardReplyListResponseDTO;
import com.hrms.project4th.mvc.dto.requestDTO.BoardReplyWriteRequestDTO;
import com.hrms.project4th.mvc.dto.page.BoardPage;
import com.hrms.project4th.mvc.dto.page.BoardPageMaker;
import com.hrms.project4th.mvc.entity.BoardReply;
import com.hrms.project4th.mvc.repository.BoardReplyMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.sql.SQLDataException;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardReplyService {
    private final BoardReplyMapper boardReplyMapper;

//    public  modifyReply() {
//    }

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

    public BoardReplyListResponseDTO save(BoardReplyWriteRequestDTO dto) throws SQLDataException {
        BoardReply boardReply = dto.changeEntity();

        boolean flag = boardReplyMapper.save(boardReply);
        if (!flag) {
            log.warn("fail to save Reply");
            throw new SQLDataException("fail to save Reply");
        }
        return findAll(dto.getBoardNo(),new BoardPage(5,1));
    }

    public BoardReplyListResponseDTO delete(BoardReplyDeleteRequestDTO dto) throws SQLDataException {

        BoardReply boardReply = dto.changeEntity();
        log.info("boardReply : {}",boardReply);
        BoardReply one = boardReplyMapper.findOne(dto.getRepNo());
        boolean flag = boardReplyMapper.delete(boardReply);
        if(!flag){
            log.warn("fail to delete Reply");
            throw new SQLDataException("fail to delete Reply");
        }

        log.info("one : {}",one);
        return findAll(one.getBoardNo(),new BoardPage(5,1));
    }

    public BoardReplyListResponseDTO modify(BoardReplyModifyRequestDTO dto) throws SQLException {

        boolean flag=boardReplyMapper.modify(dto);
        if(!flag){
            log.warn("fail to modify Reply");
            throw new SQLException("fail to modify Reply");
        }
        BoardReply boardReply = boardReplyMapper.findOne(dto.getRepNo());
        return findAll(boardReply.getBoardNo(),new BoardPage(5,1));
    }
}
