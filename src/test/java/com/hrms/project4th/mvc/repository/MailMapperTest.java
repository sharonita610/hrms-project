package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.MailResponseDTO;
import com.hrms.project4th.mvc.dto.page.MailPage;
import com.hrms.project4th.mvc.dto.page.MailSearch;
import com.hrms.project4th.mvc.dto.responseDTO.MailDetailResponseDTO;
import com.hrms.project4th.mvc.entity.CheckStatus;
import com.hrms.project4th.mvc.entity.Mail;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class MailMapperTest {
    @Autowired
    MailMapper mailMapper;

   @Test
   @DisplayName("사원번호가 n번인 사람의 메일을 n+1번사원에게 전송한다")
    void saveMailTest(){

       for (int i =1; i<=15; i++) {
//           Mail mailTest = Mail.builder().mailTitle("테스트용메일"+i).mailContent("테스트용메일입니다"+i).mailFrom(8L).mailTo(10L).build();

           Mail mailTest = Mail.builder().mailTitle("테스트용 메일" + i).mailContent(i + "테스트용메일입니다").mailFrom(2L).mailTo(6L).build();
           mailMapper.sendRequest(mailTest);
       }
   }


    @Test
    @DisplayName("5번사원이 1번 사원에게 보낸 메일의 개수는 71개이다")
    void getMailListTest(){
       MailSearch mailSearch = new MailSearch();
        List<MailResponseDTO> mailList = mailMapper.getMailList(1L,mailSearch);
        for (MailResponseDTO mailResponseDTO : mailList) {
            System.out.println(mailResponseDTO);
        }
        System.out.println(mailList.size());

    }

//    @Test
//    @DisplayName("메일번호가 50번 번호의 제목은 테스트용 메일15이다")
//    void getMailDetailTest(){
//       MailSearch mailSearch = new MailSearch();
//        MailDetailResponseDTO mailDetailList = mailMapper.getMailDetail(MailSearch search);
//        System.out.println(mailDetailList.toString());
//    }


    @Test
    @DisplayName("사원번호 2번에게 온 메일 의 status가 N인 게시글만 조회되어야한다")
    void getMailListByStatusTest(){
        List<MailResponseDTO> mailListByStatus = mailMapper.getMailListByStatus(2L, new MailSearch(), CheckStatus.N);
        for (MailResponseDTO listByStatus : mailListByStatus) {
            System.out.println(listByStatus);
        }
        System.out.println(mailListByStatus.size());
    }

    @Test
    @DisplayName("메일번호가 121번인 메일이 삭제되어야한다")
    void mailDeleteTest(){
       mailMapper.deleteMailByNum(120L);
    }




}