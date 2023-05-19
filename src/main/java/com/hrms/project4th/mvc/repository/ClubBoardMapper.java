package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.responseDTO.ClubBoardResponseDTO;
import com.hrms.project4th.mvc.dto.responseDTO.MyClubBoardResponseDTO;
import com.hrms.project4th.mvc.entity.ClubBoard;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ClubBoardMapper {
    List<ClubBoardResponseDTO> findAllClubBoard(); // 전체 동호회 게시글 조회(디폴트)
    List<ClubBoardResponseDTO> findByEmpNoClubBoard(Long empNo); // 내 동호회 게시글만 조회
    List<MyClubBoardResponseDTO> myClubBoardList(Long empNo);


    // 내가 작성한 게시글 목록 조회
    ClubBoardResponseDTO detailClubBoard(Long cbNo);   // 클릭한 게시글 상세 조회
    boolean clubBoardSave(ClubBoard clubBoard);    // 새 동호회 게시글 작성
    boolean clubBoardDelete(Long cbNo);  // 동호회 게시글 삭제
    boolean clubBoardModify(ClubBoard clubBoard);  // 동호회 게시글 수정

}
