package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.entity.TestEntity;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class TestEntityMapperTest {

    @Autowired
    TestEntityMapper testEntityMapper;

    @Test
    void save(){
        for (int i = 1; i <=300; i++) {
            TestEntity b = TestEntity.builder()
                    .empName("JACKSON" + i)
                    .build();
            boolean flag = testEntityMapper.save(b);
            assertTrue(flag);


        }

    }

}