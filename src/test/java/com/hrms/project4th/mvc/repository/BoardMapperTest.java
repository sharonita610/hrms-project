package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.page.BoardSearch;
import com.hrms.project4th.mvc.dto.responseDTO.MainBoardResponseDTO;
import com.hrms.project4th.mvc.entity.BdType;
import com.hrms.project4th.mvc.entity.Board;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.hrms.project4th.mvc.entity.BdType.FREE;
import static com.hrms.project4th.mvc.entity.BdType.NOTICE;
import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BoardMapperTest {

    @Autowired
    BoardMapper boardMapper;

    @Test
    @DisplayName("게시글 301개 저장하는 기능")
    void saveTest() {

        for (int i = 1; i <= 301; i++) {
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


    }

    @Test
    @DisplayName("게시글 List를 보여주는 기능")
    void findAllTest() {
        long empNo=5L;
        BoardSearch bs=new BoardSearch();
        List<Board> boards = boardMapper.boardFindAll(bs);
        System.out.println(boards);


    }

    @Test
    @DisplayName("게시글 List 중 원하는 사원만(사원번호) 보여주는 기능")
    void findOneTest() {
        Long emNo = 5L;
        List<Board> boards = boardMapper.boardFindOneByEno(emNo);
        System.out.println("boards = " + boards);
    }

    @Test
    @DisplayName("게시글 중 게시글번호를 입력하여 일치하는 게시물을 보여주는 기능")
    void boardDetailTest() {
        Long boardNo = 5L;
        Board board = boardMapper.boardDetail(boardNo);
        System.out.println("boards = " + board);
    }

    @Test
    @DisplayName("게시글 중 게시글번호를 입력하여 일치하는 게시물을 제거하는 기능")
    @Rollback
    @Transactional
    void boardDeleteTest() {
        Long boardNo = 5L;
        boolean flag = boardMapper.boardDelete(boardNo);
        assertTrue(flag);
    }

    @Test
    @DisplayName("게시글 중 게시글번호를 입력하여 일치하는 게시물을 수정하는 기능")
    @Rollback
    @Transactional
    void boardModifyTest() {
        Board b = Board.builder()
                .boardNo(1L)
                .bdTitle("modifyTitle")
                .bdContent("modifyContent")
                .bdType(FREE)
                .build();

        boolean flag = boardMapper.boardModify(b);
        assertTrue(flag);
    }

    @Test
    @DisplayName("메인화면에 띄어줄 boardList")
    void showMainBoardList(){
        BoardSearch bs=new BoardSearch();
        List<Board> mainBoardResponseDTOS = boardMapper.showAllMainBoard(bs);
        System.out.println(mainBoardResponseDTOS);


    }


}