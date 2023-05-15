package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.Page.BoardPage;
import com.hrms.project4th.mvc.entity.BoardReply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface BoardReplyMapper {

    List<BoardReply> findAll(long boardNo, BoardPage page);

    boolean save(BoardReply boardReply);
    boolean delete(BoardReply boardReply);

    int countReply(long boardNo);

}
