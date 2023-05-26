package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.requestDTO.ClubJoinRequestDTO;
import com.hrms.project4th.mvc.dto.responseDTO.JoinedClubListResponseDTO;
import com.hrms.project4th.mvc.entity.EmpClub;
import com.hrms.project4th.mvc.repository.ClubJoinMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ClubJoinService {

    private final ClubJoinMapper clubJoinMapper;

    // 동호회 회원 신규가입
    public boolean clubJoin(ClubJoinRequestDTO dto) {
        return clubJoinMapper.clubJoin(new EmpClub(dto));
    }

    // 동호회 회원 탈퇴
    public boolean clubLeave(ClubJoinRequestDTO dto) {
        return clubJoinMapper.clubLeave(new EmpClub(dto));
    }

    // 내가 가입한 동호회 목록 조회
    public List<JoinedClubListResponseDTO> joinedClubList(Long empNo) {
        return clubJoinMapper.joinedClubList(empNo);
    }
}
