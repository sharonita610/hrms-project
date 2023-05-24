package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.requestDTO.ClubReplyModifyRequestDTO;
import com.hrms.project4th.mvc.dto.requestDTO.ClubReplySaveRequestDTO;
import com.hrms.project4th.mvc.dto.responseDTO.ClubReplyListResponseDTO;
import com.hrms.project4th.mvc.entity.ClubReply;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ClubReplyMapperTest {

    @Autowired
    ClubReplyMapper clubReplyMapper;

    @Test
    @DisplayName("댓글 등록에 성공해야 한다.")
    void clubReplySaveTest() {
        ClubReplySaveRequestDTO dto = ClubReplySaveRequestDTO.builder()
                .clubRepContent("추카추카추카추카추카")
                .empNo(1L)
                .cbNo(4L)
                .build();

        boolean b = clubReplyMapper.clubReplySave(new ClubReply(dto));
        assertTrue(b);
    }

    @Test
    @DisplayName("클릭한 게시글의 댓글 전체 조회에 성공해야 한다.")
    void clubReplyListAllTest() {
        List<ClubReplyListResponseDTO> dto = clubReplyMapper.clubReplyListAll(5L);
        for (ClubReplyListResponseDTO clubReplyListResponseDTO : dto) {
            System.out.println("clubReplyListResponseDTO = " + clubReplyListResponseDTO);
        }
    }

    @Test
    @DisplayName("내가 작성한 댓글 목록만 조회되어야 한다.")
    void clubReplyMyListTest() {
        List<ClubReplyListResponseDTO> clubReplyListResponseDTOS = clubReplyMapper.clubReplyMyList(6L);
        for (ClubReplyListResponseDTO clubReplyListResponseDTO : clubReplyListResponseDTOS) {
            System.out.println("clubReplyListResponseDTO = " + clubReplyListResponseDTO);
        }
    }

    @Test
    @DisplayName("댓글번호를 이용한 동호회 댓글 삭제에 성공해야 한다")
    void clubReplyDeleteTest() {
        boolean b = clubReplyMapper.clubReplyDelete(3L);
        assertTrue(b);
    }

    @Test
    @DisplayName("댓글 수정에 성공해야 한다.")
    void clubReplyModifyTest() {
        ClubReplyModifyRequestDTO dto = ClubReplyModifyRequestDTO.builder()
                .clubRepNo(2L)
                .clubRepContent("댓글수정수정2")
                .empNo(2L)
                .cbNo(5L)
                .build();

        boolean b = clubReplyMapper.clubReplyModify(new ClubReply(dto));
        assertTrue(b);
    }

}