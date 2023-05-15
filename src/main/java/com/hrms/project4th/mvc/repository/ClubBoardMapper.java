package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.entity.ClubBoard;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ClubBoardMapper {
    List<ClubBoard> findAllClubBoard(); // 전체 동호회 게시글 조회(디폴트)
    List<ClubBoard> findByEmpNoClubBoard(); // 내 동호회 게시글만 조회
    boolean clubBoardSave(ClubBoard clubBoard);    // 새 동호회 게시글 작성
    boolean clubBoardDelete(Long cbNo);  // 동호회 게시글 삭제
    boolean clubBoardModify(ClubBoard clubBoard);  // 동호회 게시글 수정

}
