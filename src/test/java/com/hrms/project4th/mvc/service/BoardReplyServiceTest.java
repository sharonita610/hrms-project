package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.page.BoardPage;
import com.hrms.project4th.mvc.dto.responseDTO.BoardReplyListResponseDTO;
import com.hrms.project4th.mvc.entity.BoardReply;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class BoardReplyServiceTest {

    @Autowired
    BoardReplyService boardReplyService;

    @Test
    @DisplayName("boardReplyService에 dto로 잘 변환됬는지 파악")
    void showMeWhatYouWant(){
        BoardPage boardPage =new BoardPage(5,1);
        BoardReplyListResponseDTO all = boardReplyService.findAll(1, boardPage);
        System.out.println(all);


    }

}