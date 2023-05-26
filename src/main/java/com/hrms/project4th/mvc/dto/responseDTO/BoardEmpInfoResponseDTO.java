package com.hrms.project4th.mvc.dto.responseDTO;

import com.hrms.project4th.mvc.entity.BoardEmpInfo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardEmpInfoResponseDTO {

    private long empNo;
    private String empName;
    private String empEmail;
    private String empPhone;
    private String deptName;
    private String posName;
    private String empGender;
    private String profile;


    public BoardEmpInfoResponseDTO(BoardEmpInfo boardEmpInfo) {
        this.empNo = boardEmpInfo.getEmpNo();
        this.empName = boardEmpInfo.getEmpName();
        this.empEmail = boardEmpInfo.getEmpEmail();
        this.empPhone = phonePattern(boardEmpInfo.getEmpPhone());
        this.deptName = boardEmpInfo.getDeptName();
        this.posName = boardEmpInfo.getPosName();
        this.empGender= String.valueOf(boardEmpInfo.getEmpGender());
        this.profile=boardEmpInfo.getProfile();

    }

    private String phonePattern(String empPhone) {
        if (empPhone.length() == 11) {
            return empPhone.substring(0, 3) + "-" + empPhone.substring(3, 7) + "-" + empPhone.substring(7, 11);
        } else {
            return "-";
        }
    }


}
