package com.hrms.project4th.mvc.api;


import com.hrms.project4th.mvc.dto.MailResponseDTO;
import com.hrms.project4th.mvc.dto.page.MailSearch;
import com.hrms.project4th.mvc.dto.responseDTO.MailThumbnailResponseDTO;
import com.hrms.project4th.mvc.entity.CheckStatus;
import com.hrms.project4th.mvc.service.MailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/hrms/mail")
@Slf4j
public class MailThumbnailController {


    private final MailService mailService;
    //접속한 사원번호로 나에게 온 메일 미리보기 해주기
    @GetMapping("/mailempNo/{mailempNo}")
    public ResponseEntity<?>getMailThumbnailList(@PathVariable Long mailempNo){
        log.info("mailempNo {}",mailempNo);
        MailSearch mailSearch = new MailSearch();
        List<MailResponseDTO> mailListByStatus = mailService.getMailListByStatus(mailempNo, mailSearch, CheckStatus.N);

        List<MailThumbnailResponseDTO> mailThumbnailResponseDTOList = mailListByStatus.stream().map(MailResponseDTO -> {
            MailThumbnailResponseDTO mailThumbnail= new MailThumbnailResponseDTO();
            mailThumbnail.setMailNo(MailResponseDTO.getMailNo());
            mailThumbnail.setSenderName(MailResponseDTO.getSenderName());
            mailThumbnail.setMailStatus(MailResponseDTO.getMailStatus());
            log.info("mailThumbnail {}",mailThumbnail);
            return mailThumbnail;
        }).collect(Collectors.toList());

        return ResponseEntity.ok().body(mailThumbnailResponseDTOList);
    }
}
