package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.ClubJoinRequestDTO;
import com.hrms.project4th.mvc.entity.EmpClub;
import com.hrms.project4th.mvc.repository.ClubJoinMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ClubJoinService {

    private final ClubJoinMapper clubJoinMapper;

    // 동호회 회원 신규가입
    public boolean clubJoin(ClubJoinRequestDTO dto) {
        return clubJoinMapper.clubJoin(new EmpClub(dto));
    }
}
