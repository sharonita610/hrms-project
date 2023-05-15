package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.requestDTO.ClubBoardModifyRequestDTO;
import com.hrms.project4th.mvc.dto.requestDTO.ClubBoardSaveRequestDTO;
import com.hrms.project4th.mvc.dto.responseDTO.ClubBoardResponseDTO;
import com.hrms.project4th.mvc.dto.responseDTO.MyClubBoardResponseDTO;
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
        List<ClubBoardResponseDTO> allClubBoard = clubBoardMapper.findAllClubBoard();
        for (ClubBoardResponseDTO clubBoard : allClubBoard) {
            System.out.println("clubBoard = " + clubBoard);
        }
    }

    @Test
    @DisplayName("사번으로 내가 가입한 동호회 게시글만 조회되어야한다.")
    void findByEmpNoClubBoardTest() {
        List<ClubBoardResponseDTO> byEmpNoClubBoard = clubBoardMapper.findByEmpNoClubBoard(1L);
        for (ClubBoardResponseDTO clubBoard : byEmpNoClubBoard) {
            System.out.println("clubBoard = " + clubBoard);
        }
    }

    @Test
    @DisplayName("내가 작성한 게시글의 목록만 조회되어야한다.")
    void myClubBoardListTest() {
        List<MyClubBoardResponseDTO> dto = clubBoardMapper.myClubBoardList(1L);
        for (MyClubBoardResponseDTO myClubBoardResponseDTO : dto) {
            System.out.println("myClubBoardResponseDTO = " + myClubBoardResponseDTO);

        }
    }

    @Test
    @DisplayName("클릭한 게시글만 상세조회되어야 한다.")
    void detailClubBoardTest() {
        ClubBoardResponseDTO clubBoard = clubBoardMapper.detailClubBoard(4L);
        System.out.println("clubBoard = " + clubBoard);
    }

    @Test
    @DisplayName("동호회 게시글이 추가되어야한다.")
    void clubBoardSaveTest() {
        ClubBoardSaveRequestDTO dto = ClubBoardSaveRequestDTO.builder()
                .cbTitle("추가제목테스트1")
                .cbContent("추가테스트내용1")
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
                .cbNo(2L)
                .cbTitle("추가한제목수정테스트**")
                .cbContent("추가내용수정**")
                .cbURL("")
                .build();

        boolean b = clubBoardMapper.clubBoardModify(new ClubBoard(dto));
        assertTrue(b);
    }

}