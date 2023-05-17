package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.entity.TestEntity;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestEntityMapper {
    boolean save(TestEntity testEntity);
}
