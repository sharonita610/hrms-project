package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.responseDTO.JoinedClubListResponseDTO;
import com.hrms.project4th.mvc.entity.EmpClub;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ClubJoinMapper {

    boolean clubJoin(EmpClub empClub);  // 동호회 신규 회원가입
    boolean clubLeave(EmpClub empClub); // 동호회 회원탈퇴
    List<JoinedClubListResponseDTO> joinedClubList(Long empNo);   // 내가 가입된 동아리 목록 조회
}
