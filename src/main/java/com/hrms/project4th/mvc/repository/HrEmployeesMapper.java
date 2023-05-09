package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.entity.HrEmployees;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface HrEmployeesMapper {

    //전체 조회 기능
    List<HrEmployees> findAll();

    //저장기능



}
