package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.dto.responseDTO.DeptBossDTO;
import com.hrms.project4th.mvc.dto.requestDTO.ModifyConfirmDTO;
import com.hrms.project4th.mvc.dto.responseDTO.LongTitleResponseDTO;
import com.hrms.project4th.mvc.dto.responseDTO.SimpleDateConfirmDTO;
import com.hrms.project4th.mvc.dto.requestDTO.RequestConfirmDTO;
import com.hrms.project4th.mvc.entity.CheckStatus;
import com.hrms.project4th.mvc.service.ConfirmService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/hrms/confirm")
public class ConfirmController {

    private final ConfirmService confirmService;

    @GetMapping("list")
    public String confirmList(@Nullable String conStatus, Model model){
        model.addAttribute("status", conStatus);
        return "confirm/confirmList";
    }

    //결재 신청폼
    @GetMapping("/rq-form")
    public String writeRequest(String deptCode, Model model){ //추후 코드 변경 : 세션에서 로그인 객체 넘겨받아 부서 확인하기
        DeptBossDTO deptBoss = confirmService.getDeptBoss("001");
        model.addAttribute("boss", deptBoss);
        return "confirm/confirm-rqform"; //jsp
    }

    //결재신청폼에서 받아온 값 DB에 전달
    @PostMapping("/rq-cnfm")
    public String requestConfirm(RequestConfirmDTO dto){
        confirmService.requestConfirm(dto);
        return "redirect:/hrms/confirm/list";
    }

    //모든결재건 리스트 불러오기
    @GetMapping("/{empNo}/{roleCode}")
    @ResponseBody
    public ResponseEntity<List> getConfirmList(@PathVariable("empNo") long empNo, @PathVariable("roleCode") @Nullable String roleCode) {
        List<SimpleDateConfirmDTO> confirmList = confirmService.getConfirmList(empNo, roleCode);
        return ResponseEntity.ok().body(confirmList);
    }

    //승인대기 리스트 불러오기
    @GetMapping("/{empNo}/{roleCode}/waiting")
    @ResponseBody
    public ResponseEntity<List> getWaitingList(@PathVariable("empNo") long empNo, @PathVariable("roleCode") @Nullable String roleCode){
        List<SimpleDateConfirmDTO> waitingList = confirmService.getWaitingList(empNo, roleCode);
        return ResponseEntity.ok().body(waitingList);
    }

    //승인 리스트 불러오기
    @GetMapping("/{empNo}/{roleCode}/checked")
    @ResponseBody
    public ResponseEntity<List> getCheckedList(@PathVariable("empNo") long empNo, @PathVariable("roleCode") @Nullable String roleCode){
        List<SimpleDateConfirmDTO> checkedList = confirmService.getCheckedList(empNo, roleCode);
        return ResponseEntity.ok().body(checkedList);
    }

    //반려리스트 불러오기
    @GetMapping("/{empNo}/{roleCode}/rejected")
    @ResponseBody
    public ResponseEntity<List> getRejectedList(@PathVariable("empNo") long empNo, @PathVariable("roleCode") @Nullable String roleCode){
        List<SimpleDateConfirmDTO> rejectedList = confirmService.getRejectedList(empNo, roleCode);
        return ResponseEntity.ok().body(rejectedList);
    }

    //검색하기
    @GetMapping("/search/{empNo}/{roleCode}/{conTitle}")
    @ResponseBody
    public ResponseEntity<List> searchConfirm(
            @PathVariable("empNo") long empNo
            , @PathVariable("roleCode") @Nullable String roleCode
            , @PathVariable("conTitle") String conTitle
    ) {
        List<SimpleDateConfirmDTO> dto = confirmService.searchConfirm(empNo, roleCode, conTitle);
        return ResponseEntity.ok().body(dto);
    }

    //결재 승인하기
    @PutMapping("/check/{conNo}")
    @ResponseBody
    public ResponseEntity<Boolean> checkConfirm(@PathVariable("conNo") long conNo){
        boolean flag = confirmService.checkConfirm(conNo);
        return ResponseEntity.ok().body(flag);
    }

    //승인거절하기
    @PutMapping("/reject/{conNo}")
    @ResponseBody
    public ResponseEntity<Boolean> rejectConfirm(@PathVariable("conNo") long conNo){

        boolean flag = confirmService.rejectConfirm(conNo);
        return ResponseEntity.ok().body(flag);
    }

    //결재 수정폼으로 이동
    @GetMapping("/modify")
    public String modifyForm(long conNo, Model model){
        DeptBossDTO deptBoss = confirmService.getDeptBoss("001");
        model.addAttribute("boss", deptBoss);
        LongTitleResponseDTO dto = confirmService.findOne(conNo);
        model.addAttribute("c", dto);
        return "confirm/modify";
    }

    //수정폼에서 값 받아서 DB에 전달
    @PostMapping("/modify")
    public String modify(ModifyConfirmDTO dto){
        boolean flag = confirmService.modifyConfirm(dto);
        return "redirect:/hrms/confirm/detail?conNo=" + dto.getConNo();
    }

    //결재 삭제
    @DeleteMapping("/delete/{conNo}")
    @ResponseBody
    public ResponseEntity<Boolean> deleteConfirm(@PathVariable("conNo") long conNo){
        return ResponseEntity.ok().body(confirmService.deleteConfirm(conNo));
    }

    //결재 상세보기로 이동
    @GetMapping("/detail")
    public String detail(long conNo, Model model){
        DeptBossDTO deptBoss = confirmService.getDeptBoss("001");
        model.addAttribute("boss", deptBoss);
        LongTitleResponseDTO dto = confirmService.findOne(conNo);
        model.addAttribute("c", dto);
        return "confirm/confirm-detail";
    }

}
