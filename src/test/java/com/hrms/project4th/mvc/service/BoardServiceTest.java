package com.hrms.project4th.mvc.service;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class BoardServiceTest {

    @Autowired
    BoardService boardService;


    @Test
    @DisplayName("DB에서 불러온 게시판의 정보를 dto를 이용하여 타입변경과 짧게 만들어 보여주는 기능")
    void findAllTest(){
//        List<BoardListResponseDTO> b = boardService.boardFindAll();
//        System.out.println("b = " + b);


    }

}