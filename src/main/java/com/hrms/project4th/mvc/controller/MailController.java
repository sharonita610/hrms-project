package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.dto.MailResponseDTO;
import com.hrms.project4th.mvc.dto.page.MailPage;
import com.hrms.project4th.mvc.dto.page.MailPageMaker;
import com.hrms.project4th.mvc.dto.page.MailSearch;
import com.hrms.project4th.mvc.dto.responseDTO.EmployeeDetailResponseDTO;
import com.hrms.project4th.mvc.dto.responseDTO.EmployeeInfoResponseDTO;
import com.hrms.project4th.mvc.dto.responseDTO.MailDetailResponseDTO;
import com.hrms.project4th.mvc.entity.CheckStatus;
import com.hrms.project4th.mvc.entity.Mail;
import com.hrms.project4th.mvc.repository.EmployeesMapper;
import com.hrms.project4th.mvc.service.EmployeesService;
import com.hrms.project4th.mvc.service.MailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.hrms.project4th.mvc.entity.CheckStatus.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/hrms")
@Slf4j
public class MailController {

    private final MailService mailService;

    //사원의 개인정보 빼오기용 서비스 객체
    private final EmployeesService employeesService;


    //메일 작성용 화면 요청 함수
    @GetMapping("/mail-write")
    public String writeRequest(Model model, Long empNo){
        EmployeeDetailResponseDTO detailedEmployee = employeesService.getDetailedEmployee(empNo);
        //메일 작성용화면에 필요한객체만 로딩
        EmployeeInfoResponseDTO employeeInfo = EmployeeInfoResponseDTO.builder().empEmail(detailedEmployee.getEmpEmail()).empName(detailedEmployee.getEmpName()).deptName(detailedEmployee.getDeptName()).posName(detailedEmployee.getPosName()).empNo(detailedEmployee.getEmpNo()).build();
        model.addAttribute("info",employeeInfo);
        model.addAttribute("empNo",empNo);
        return "/mail/write";
    }

    //메일저장(전송)서비스
    public String sendRequest(final Mail mail){

        mailService.sendRequest(mail);
        return "";
    }

    @GetMapping("/mail-list")
    //메일 불러오기서비스(로그인한 사용자 사번이 필요함)
    public String getList(Model model, Long empNo, MailSearch search){
        List<MailResponseDTO> mailList = mailService.getMailList(empNo,search);
        MailPageMaker mailPageMaker = new MailPageMaker(search,mailService.mailPageCount(empNo,search));

        model.addAttribute("mailPageMaker",mailPageMaker);
        model.addAttribute("mList",mailList);
        model.addAttribute("ms",search);
        model.addAttribute("num",empNo);
        return "/mail/mail";
    }

    @GetMapping("/mail-detail")
    //메일 하나확인하기(개개인 메일의 번호가필요함)
    public String getMailDetail(Model model, Long mailNo, MailSearch search, Long empNo){
        log.info("mailNo {}",mailNo);
        log.info("search {}",search);
        log.info("empNo {}",empNo);
        MailDetailResponseDTO mailDetail = mailService.getMailDetail(mailNo, search);
        model.addAttribute("md",mailDetail);
        return "/mail/detail";
    }

    @GetMapping("/mail-list-status")
    //사원번호에맞는 메일 리스트리턴(상태값에 따라 구분 Y/N)
    public String getMailListByStatus(Model model, @RequestParam("empNo") Long empNo, @RequestParam("status") CheckStatus status, MailSearch search){
        log.info("status: {}", status);
        log.info("search : {}",search);
        List<MailResponseDTO> mailListByStatus = mailService.getMailListByStatus(empNo,search, status);
        MailPageMaker mailPageMaker = new MailPageMaker(search,mailService.getMailPageCountByStatus(empNo,status));
        log.info("mailPageMaker :{}",mailPageMaker);
        model.addAttribute("mailPageMaker",mailPageMaker);
        model.addAttribute("mList",mailListByStatus);
        model.addAttribute("status",status);
        model.addAttribute("ms",search);

        return "/mail/mailstatus";
    }

    @GetMapping("/mail-delete")
    // 메일 삭제하기(사원번호에 맞는 메일을 삭제해야함)
    public String mailDeleteByNum(Long mailNo, @RequestParam(value = "empNo") Long empNo, MailSearch search) {
        log.info("mailNo {}: ", mailNo);
        log.info("search {}: ", search);
        log.info("empNo {} : ",empNo);
        log.info("mailPageNo {} : ",search.getMailPageNo());
        mailService.deleteByNum(mailNo);
        //메일 타입에 따라 리턴값 달라진다
        String mailType = search.getMailType();
        if(mailType.equals("mailto")) {
            return "redirect:/hrms/mail-list/?mailPageNo="+search.getMailPageNo()+"&empNo="+empNo+"&mailType="+"mailto";
        }else{
            return "redirect:/hrms/mail-list/?mailPageNo="+search.getMailPageNo()+"&empNo="+empNo+"&mailType="+"mailfrom";
        }
    }


    @GetMapping("/mail-delete-status")
    // 메일 삭제하기(사원번호에 맞는 메일을 삭제해야함)
    public String mailDeleteByNum(Long mailNo, @RequestParam(value = "empNo") Long empNo, MailSearch search, @RequestParam(value = "status") CheckStatus status) {
        log.info("mailNo {}: ", mailNo);
        log.info("empNo {} : ", empNo);
        log.info("status {}", status);
        log.info("mailPageNo{}",search.getMailPageNo());
        //메일 타입에 따라 리턴값 달라진다
        if(status==N){
            mailService.deleteByNum(mailNo);
            return "redirect:/hrms/mail-list-status/?mailPageNo="+search.getMailPageNo()+"&empNo="+empNo+"&mailType="+search.getMailType()+"&status="+N;
        }else{
            mailService.deleteByNum(mailNo);
            return "redirect:/hrms/mail-list-status/?mailPageNo="+search.getMailPageNo()+"&empNo="+empNo+"&mailType="+search.getMailType()+"&status="+Y;
        }
    }







}
