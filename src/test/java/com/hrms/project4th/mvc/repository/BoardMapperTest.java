package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.entity.BdType;
import com.hrms.project4th.mvc.entity.Board;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BoardMapperTest {

    @Autowired
    BoardMapper boardMapper;

    @Test
    @DisplayName("게시글 10개 저장하는 기능")
    void saveTest() {

        for (int i = 0; i < 10; i++) {
            Board b = Board.builder()
                    .boardNo(i)
                    .bdType(BdType.NOTICE)
                    .bdTitle("board title" + i)
                    .bdContent("board content" + i)
                    .empNo(i)
                    .build();
            boolean flag = boardMapper.boardSave(b);
            assertTrue(flag);
        }


    }


}