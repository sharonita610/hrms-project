package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.AutoLoginDTO;
import com.hrms.project4th.mvc.dto.requestDTO.LoginRequestDTO;
import com.hrms.project4th.mvc.dto.requestDTO.VerificateEmpPasswordRequestDTO;
import com.hrms.project4th.mvc.dto.responseDTO.EmployeeDetailResponseDTO;
import com.hrms.project4th.mvc.dto.responseDTO.LoginUserResponseDTO;
import com.hrms.project4th.mvc.entity.Employees;
import com.hrms.project4th.mvc.entity.LoginResult;
import com.hrms.project4th.mvc.repository.EmployeesMapper;
import com.hrms.project4th.mvc.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.time.LocalDateTime;

import static com.hrms.project4th.mvc.entity.LoginResult.*;
import static com.hrms.project4th.mvc.util.LoginUtil.*;

@Slf4j
@Service
@RequiredArgsConstructor
public class LoginService {

    private final EmployeesMapper employeesMapper;
    // 비밀번호 암호화 하기 위한 코드
    // private final PasswordEncoder encoder;


    // 로그인 검증 처리하기
    public LoginResult authenticate(
            LoginRequestDTO dto, HttpSession session, HttpServletResponse response) {

        Employees foundEmployee = employeesMapper.findEmployee(dto.getEmpEmail());

        log.info(dto.getEmpEmail());

        // 사원이 등록되어있는지 확인
        if (null == foundEmployee) {
            log.info("{} - 사원 등록이 되어있지 않습니다.", dto.getEmpEmail());
            return NO_EMP_EMAIL;
        }
        // 비밀번호 매칭 확인
        if (!(dto.getEmpPassword().matches(foundEmployee.getEmpPassword()))) {
            log.info("비밀번호 불일치합니다!");
            return WRONG_PW;
        }

        // 자동 로그인 체크 여부 확인, dto가 자동 로그인 처리 되어있다면
        if (dto.isAutoLogin()) {
            // 쿠키 설정을 해준다
            Cookie autoLoginCheck = new Cookie(AUTO_LOGIN_CHECK, session.getId());


            int limitTime = 60 * 60 * 24; //24시간 자동 저장 기능
            autoLoginCheck.setMaxAge(limitTime); // 자동 저장 시간 셋팅
            autoLoginCheck.setPath("/"); // 모든 path 에서 사용 가능하게끔 한다.

            // 클라이언트한테 자동 로그인 되었다고 response 해주기
            response.addCookie(autoLoginCheck);

            // 로그인 한 내용을 db에 값과 수명을 저장하기
            employeesMapper.saveAutoLogin(
                    AutoLoginDTO.builder()
                            .empSession(session.getId())
                            .empEmail(dto.getEmpEmail())
                            .cookieLimitTime(LocalDateTime.now().plusDays(1))
                            .build()
            );


        }
        session.setAttribute("login", dto);

        log.info("{}님 로그인 성공! : {}", dto.getEmpEmail(), dto);
        return SUCCESS;

    }


    // 로그인 유지
    public void maintainLoginState(HttpSession session, String empEmail) {

        EmployeeDetailResponseDTO dto = employeesMapper.logedInDetail(empEmail);
        dto.profileWithRootPath(dto.getProfile());

        //  세션에 저장
        session.setAttribute(LOGIN_KEY, dto);
        session.setAttribute("login", dto);
        log.info("empDetail {} ", dto);
        // 세션의 기본 수명을 설정
        session.setMaxInactiveInterval(60 * 60); // 1시간
    }


    public void autoLoginClear(HttpServletRequest request, HttpServletResponse response) {

        Cookie c = WebUtils.getCookie(request, AUTO_LOGIN_CHECK);

        if (c != null) {
            c.setMaxAge(0);
        }
        response.addCookie(c);

        employeesMapper.saveAutoLogin(
                AutoLoginDTO.builder()
                        .empSession("none")
                        .cookieLimitTime(LocalDateTime.now())
                        .empEmail(LoginUtil.getCurrentLoginMemberAccount(request.getSession()))
                        .build()


        );

    }



    public boolean verificateEmp(VerificateEmpPasswordRequestDTO dto) {

        log.info("{}", dto);

        employeesMapper.verificateEmp(dto);

        return true;
    }


}

