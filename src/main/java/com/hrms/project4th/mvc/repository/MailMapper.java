package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.MailResponseDTO;
import com.hrms.project4th.mvc.dto.Page.MailPage;
import com.hrms.project4th.mvc.dto.Page.MailSearch;
import com.hrms.project4th.mvc.dto.responseDTO.MailDetailResponseDTO;
import com.hrms.project4th.mvc.entity.CheckStatus;
import com.hrms.project4th.mvc.entity.Mail;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MailMapper {
    //메일 저장
    boolean sendRequest(Mail mail);

    //메일 리스트 받아오기
    List<MailResponseDTO> getMailList(@Param("empNo")Long empNo,@Param("s")MailSearch search);

    //메일 상세보기
    List<MailDetailResponseDTO> getMailDetail(@Param("s")MailSearch search, @Param("empNo") Long empNo, @Param("mailNo")Long mailNo);

    //메일 상태값 변경 확인을하면 상태값이 y로 변경되어야한다
    void mailViewUpdate(Long mailNo);

    //접속한 사원의 사번에맞는 메일출력(상태에 따라 읽은메일 읽지않은메일 구분)
    List<MailResponseDTO> getMailListByStatus(@Param("empNo") Long empNo,@Param("s") MailSearch search, @Param("status") CheckStatus status);

    //메일번호에 맞는 메일 삭제
    void deleteMailByNum(Long mailNo);

    //보낸메일 / 안보낸 메일로 구분해서 페이징할 수를 구하는 함수
    int getMailPageCount(Long empNo, @Param("s")MailSearch search);

    //메일의 읽은상태 y/n 상태로 페이징할 개수를 구하는 함수
    int getMailPageCountByStatus(Long empNo,@Param("s") CheckStatus status);
}
