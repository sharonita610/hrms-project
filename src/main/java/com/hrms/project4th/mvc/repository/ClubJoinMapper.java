package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.entity.EmpClub;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ClubJoinMapper {

    boolean clubJoin(EmpClub empClub);
}
