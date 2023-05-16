package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.requestDTO.ClubJoinRequestDTO;
import com.hrms.project4th.mvc.dto.responseDTO.JoinedClubListResponseDTO;
import com.hrms.project4th.mvc.entity.EmpClub;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ClubJoinMapperTest {

    @Autowired
    ClubJoinMapper clubJoinMapper;

    @Test
    @DisplayName("동호회 신규 회원가입에 성공해야한다.")
    void clubJoinTest() {
        ClubJoinRequestDTO dto = ClubJoinRequestDTO.builder()
                .empNo(5L)
                .clubCode(2L)
                .build();

        boolean b = clubJoinMapper.clubJoin(new EmpClub(dto));

        assertTrue(b);
    }

    @Test
    @DisplayName("동호회 회원 탈퇴 성공해야한다")
    void clubLeaveTest() {
        ClubJoinRequestDTO dto = ClubJoinRequestDTO.builder()
                .empNo(5L)
                .clubCode(2L)
                .build();

        boolean b = clubJoinMapper.clubLeave(new EmpClub(dto));
        assertTrue(b);
    }

    @Test
    @DisplayName("내가 가입한 동호회 목록만 조회되어야 한다.")
    void joinedClubListTest() {
        List<JoinedClubListResponseDTO> empClubs = clubJoinMapper.joinedClubList(1L);
        for (JoinedClubListResponseDTO empClub : empClubs) {
            System.out.println("empClub = " + empClub);
        }
    }


}