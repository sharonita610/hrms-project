package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.entity.BoardEmpInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface BoardEmpInfoMapper {

    // 모든 유저 정보를 보여주는 기능
    List<BoardEmpInfo> showAllInfo();

}
