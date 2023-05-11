package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.entity.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {

    //게시글 전체 조회
    List<Board> boardFindAll();

    //사원번호를 통해 게시글 조회
    List<Board> boardFindOneByEno(Long empNo);

    //게시글번호 통해 게시글 조회
    Board boardFindOneByBoardNo(Long boardNo);

    //게시글 상세보기
    Board boardDetail(Long BoardNo);

    //게시글 추가
    boolean boardSave(Board board);

    //게시글 삭제
    boolean boardDelete(Long boardNo);

    //게시글 수정
    boolean boardModify(Board board);
}
