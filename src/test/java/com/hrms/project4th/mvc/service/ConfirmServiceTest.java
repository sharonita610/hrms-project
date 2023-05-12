package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.ModifyConfirmDto;
import com.hrms.project4th.mvc.dto.RequestConfirmDto;
import com.hrms.project4th.mvc.dto.getConfirmListDto;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ConfirmServiceTest {

    @Autowired
    ConfirmService confirmService;

    @Test
    @DisplayName("서비스에 결재요청을 하면 결재 테이블에 데이터가 생성된다")
    void requestConfirmTest(){

        for (int i = 1; i < 20 ; i++) {

        RequestConfirmDto dto = RequestConfirmDto.builder()
                .fromEmpNo(i)
                .toEmpNo(1L)
                .conTitle("[제목] 테스트 결재 요청 " + i)
                .conContent("[내용] 테스트 결재 내용 " + i)
                .build();

        boolean flag = confirmService.requestConfirm(dto);
        assertTrue(flag);
        }
    }

    @Test
    @DisplayName("롤넘버가 11111이 아니면 요청한 미결재내역을 불러온다")
    void getWaitingListTest1(){
        List<getConfirmListDto> list = confirmService.getWaitingList(4L, null);
        System.out.println(list);
        assertEquals(1, list.size());
    }

    @Test
    @DisplayName("롤넘버가 11111이면 요청받은 미결재내역을 불러온다")
    void getWaitingListTest2(){
        List<getConfirmListDto> list = confirmService.getWaitingList(1L, "11111");
        System.out.println(list);

    }


    @Test
    @DisplayName("롤넘버가 11111이면 요청받은 승인내역을 불러온다")
    void getCheckedList1(){
        List<getConfirmListDto> checkedList = confirmService.getCheckedList(1L, "11111");
        System.out.println(checkedList);
        assertEquals(2, checkedList.size());
    }

    @Test
    @DisplayName("롤넘버가 11111이 아니면 요청한 승인내역을 불러온다")
    void getCheckedLis2t(){
        List<getConfirmListDto> checkedList = confirmService.getCheckedList(3L, null);
        System.out.println(checkedList);

    }

    @Test
    @DisplayName("결재 식별번호로 결재 승인을 한다.")
    void checkConfirmTest(){
        long conNo = 2L;
        boolean flag = confirmService.checkConfirm(conNo);

        assertTrue(flag);
    }

    @Test
    @DisplayName("결재 식별번호로 결재 거절을 한다.")
    void rejectConfirmTest(){
        long conNo = 16L;
        boolean flag = confirmService.rejectConfirm(conNo);

        assertTrue(flag);
    }

    @Test
    @DisplayName("결재요청건을 수정할 수 있다.")
    void modifyTest(){
        ModifyConfirmDto confirm = ModifyConfirmDto.builder()
                .conNo(3L)
                .conTitle("수정테스트제목")
                .conContent("수정테스트내용")
                .build();
        confirmService.modifyConfirm(confirm);
    }
}
