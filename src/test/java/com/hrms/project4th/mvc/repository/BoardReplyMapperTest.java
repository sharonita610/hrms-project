package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.entity.BdType;
import com.hrms.project4th.mvc.entity.Board;
import com.hrms.project4th.mvc.entity.BoardReply;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class   BoardReplyMapperTest {

    @Autowired
    BoardReplyMapper boardReplyMapper;
    @Autowired
    BoardMapper boardMapper;

    @Test
    @DisplayName("댓글 저장 기능")
    void save(){
        for (int i = 1; i <= 100; i++) {
            Board b = Board.builder()
                    .boardNo(i)
                    .bdType(BdType.valueOf("FREE"))
                    .bdTitle("board title" + i)
                    .bdContent("board content / board content" + i)
                    .empNo(i)
                    .build();
            boolean flag = boardMapper.boardSave(b);
            assertTrue(flag);
        }
        for (int i = 1; i <=300 ; i++) {

            BoardReply build = BoardReply.builder()
                    .repContent("reply content" + i)
                    .boardNo((long)(Math.random() * 99 + 1))
                    .empNo(i)
                    .build();
            boardReplyMapper.save(build);

        }



    }

}