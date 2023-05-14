package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.ClubBoardModifyRequestDTO;
import com.hrms.project4th.mvc.dto.ClubBoardSaveRequestDTO;
import com.hrms.project4th.mvc.entity.ClubBoard;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ClubBoardMapperTest {

    @Autowired
    ClubBoardMapper clubBoardMapper;

    @Test
    @DisplayName("전체 동호회 게시글이 조회되어야한다.")
    void clubBoardFindAllTest() {
        List<ClubBoard> allClubBoard = clubBoardMapper.findAllClubBoard();
        for (ClubBoard clubBoard : allClubBoard) {
            System.out.println("clubBoard = " + clubBoard);
        }
    }

    @Test
    @DisplayName("동호회 게시글이 추가되어야한다.")
    void clubBoardSaveTest() {
        ClubBoardSaveRequestDTO dto = ClubBoardSaveRequestDTO.builder()
                .cbTitle("추가제목테스트@@")
                .cbContent("추가테스트내용@@")
                .cbURL("")
                .clubCode(1)
                .empNo(1)
                .build();

        boolean b = clubBoardMapper.clubBoardSave(new ClubBoard(dto));
        assertTrue(b);
    }

    @Test
    @DisplayName("동호회 게시글이 삭제되어야 한다.")
    void clubBoardDeleteTest() {
        boolean b = clubBoardMapper.clubBoardDelete(3L);
        assertTrue(b);
    }

    @Test
    @DisplayName("동호회 게시글 수정에 성공해야한다.")
    void clubBoardModifyTest() {
        ClubBoardModifyRequestDTO dto = ClubBoardModifyRequestDTO.builder()
                .cbNo(4L)
                .cbTitle("추가한제목수정테스트**")
                .cbContent("추가내용수정**")
                .cbURL("")
                .build();

        boolean b = clubBoardMapper.clubBoardModify(new ClubBoard(dto));
        assertTrue(b);
    }

}