package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.MailResponseDTO;
import com.hrms.project4th.mvc.dto.page.MailPage;
import com.hrms.project4th.mvc.dto.page.MailSearch;
import com.hrms.project4th.mvc.dto.responseDTO.MailDetailResponseDTO;
import com.hrms.project4th.mvc.entity.CheckStatus;
import com.hrms.project4th.mvc.entity.Mail;
import com.hrms.project4th.mvc.repository.MailMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MailService {

    private final MailMapper mailMapper;

    //메일저장
    public void sendRequest(Mail mail){

        mailMapper.sendRequest(mail);

    }

    //메일 리스트가져오기
    //(나와 관련된 내가보낸 내가 받은)
    public List<MailResponseDTO> getMailList(Long mailNo, MailSearch search){

        return mailMapper.getMailList(mailNo,search);
    }

    //특정 메일읽기 (메일상세보기) (메일의 번호가 필요함!)
    public MailDetailResponseDTO getMailDetail(Long mailNo, MailSearch search) {
        //메일을 상세보기했으니 조회함(y)로 변경되어야한다
        if(search.getMailType().equals("mailfrom")){
            return mailMapper.getMailDetail(mailNo);
        }else{
            mailMapper.mailViewUpdate(mailNo);
            return mailMapper.getMailDetail(mailNo);
        }
    }

    public List<MailResponseDTO> getMailListByStatus(Long empNo,MailSearch search, CheckStatus status) {
        //메일의 읽은상태 읽지않은상태(mailStatus로 메일을 조회할 수있다)
       return mailMapper.getMailListByStatus(empNo,search,status);
    }

    public void deleteByNum(Long mailNo) {
        //메일의 번호로 메일을 삭제 할 수 있다.
        mailMapper.deleteMailByNum(mailNo);
    }

    public int mailPageCount(Long empNo,MailSearch search) {
        return mailMapper.getMailPageCount(empNo ,search);
    }

    public int getMailPageCountByStatus(Long empNo, CheckStatus status) {
        return mailMapper.getMailPageCountByStatus(empNo,status);
    }
}
