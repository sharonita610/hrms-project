package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.page.BoardPage;
import com.hrms.project4th.mvc.dto.page.BoardSearch;
import com.hrms.project4th.mvc.entity.BdType;
import com.hrms.project4th.mvc.entity.Board;
import com.hrms.project4th.mvc.entity.BoardReply;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BoardReplyMapperTest {

    @Autowired
    BoardReplyMapper boardReplyMapper;
    @Autowired
    BoardMapper boardMapper;

    @Test
    @DisplayName("댓글 저장 기능")
    void save() {
//        for (int i = 1; i <= 300; i++) {
//            Board b = Board.builder()
//                    .boardNo(i)
//                    .bdType(BdType.valueOf("NOTICE"))
//                    .bdTitle("공지사항" + i)
//                    .bdContent("공지내용 입니다!!!!!" + i)
//                    .empNo((long)(Math.random()*61+1))
//                    .build();
//            boolean flag = boardMapper.boardSave(b);
//            assertTrue(flag);
//        }
        for (int i = 1; i <= 1000; i++) {

            BoardReply build = BoardReply.builder()
                    .repContent("댓글 입니다!!!!" + i)
                    .boardNo((long) (Math.random() * 300 + 1))
                    .empNo((long)(Math.random()*61+1))
                    .build();
            boardReplyMapper.save(build);

        }

    }

    @Test
    void findAll() {
        BoardPage p =new BoardPage();

        List<BoardReply> all = boardReplyMapper.findAll(300, p);
        System.out.println(all);


    }
}

