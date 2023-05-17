package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.AutoLoginDTO;
import com.hrms.project4th.mvc.dto.requestDTO.LoginRequestDTO;
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
import static com.hrms.project4th.mvc.util.LoginUtil.AUTO_LOGIN_COOKIE;
import static com.hrms.project4th.mvc.util.LoginUtil.LOGIN_KEY;

@Slf4j
@Service
@RequiredArgsConstructor
public class LoginService {

    private final EmployeesMapper employeesMapper;
    // 로그인 검증 처리하기

    public LoginResult authenticate(
            LoginRequestDTO dto,
            HttpSession session,
            HttpServletResponse response) {

        Employees foundEmployee = employeesMapper.findEmployee(dto.getEmpNo());


        // 사원이 등록되어있는지 확인
        if (null == foundEmployee) {
            log.info("{} - 사원 등록이 되어있지 않습니다.", dto.getEmpNo());
            return NO_EMP_NO;
        }
        // 비밀번호 매칭 확인
        if (!(dto.getPassword() == (employeesMapper.findEmployee(dto.getEmpNo())).getEmpPassword())){
            log.info("비밀번호 불일치합니다!");
            return NO_PW;
        }

        // 자동로그인 체크 여부 확인
        if (dto.isAutoLogin()) {
            // 1. 쿠키 생성 - 쿠키 값에 세션 아이디를 저장
            Cookie autoLoginCookie
                    = new Cookie(AUTO_LOGIN_COOKIE, session.getId());

            // 2. 쿠키 셋팅 - 수명이랑 사용 경로
            int limitTime = 60 * 60 * 24 * 90;
            autoLoginCookie.setMaxAge(limitTime);
            autoLoginCookie.setPath("/"); // 전체경로

            // 3. 쿠키를 클라이언트에 응답전송
            response.addCookie(autoLoginCookie);

            // 4. db에도 쿠키에 저장된 값과 수명을 저장
            employeesMapper.saveAutoLogin(
                    AutoLoginDTO.builder()
                            .sessionId(session.getId())
                            .empNo(String.valueOf(dto.getEmpNo()))
                            .limitTime(LocalDateTime.now().plusDays(90))
                            .build()
            );


        }
        log.info("{}님 로그인 성공!", employeesMapper.findEmployee(dto.getEmpNo()));
        return SUCCESS;
    }
    public void maintainLoginState(HttpSession session, String empNo) {

        // 현재 로그인한 사람의 모든 정보
        Employees employee = getMember(Long.parseLong(empNo));

        // 현재 로그인한 사람의 화면에 보여울 일부정보
        LoginUserResponseDTO dto = LoginUserResponseDTO.builder()
                .empNo(String.valueOf(employee.getEmpNo()))
                .empName(employee.getEmpName())
                .auth(employee.getAuth().toString())
                .email(employee.getEmpEmail())
                .profile(employee.getProfileImage())
                .build();

        // LoginUtil.LOGIN_KEY
        // 그정보를 세션에 저장
        session.setAttribute(LOGIN_KEY, dto);

        // 세션의 수명을 설정
        session.setMaxInactiveInterval(60 * 60); // 1시간
    }

    //  멤버 정보를 가져오는 서비스 기능
    public Employees getMember(long empNo) {



        return employeesMapper.findEmployee(empNo);

    }

    // 자동로그인 기능 해제하기
    public void autoLoginReset(
            HttpServletRequest request,
            HttpServletResponse response) {

        // 1. 자동로그인 쿠키를 가져온다.
        Cookie c = WebUtils.getCookie(request, AUTO_LOGIN_COOKIE);

        // 2. 쿠키를 삭제한다.
        // -> 쿠키의 수명을 0초로 만들어서 다시 클라이언트에게 응답.
        if (c != null) {
            c.setMaxAge(0);

        }
        response.addCookie(c);

        // 3. 데이터베이스에서도 자동로그인을 해제한다.
        employeesMapper.saveAutoLogin(
                AutoLoginDTO.builder()
                        .sessionId("none")
                        .limitTime(LocalDateTime.now())
                        .empNo(LoginUtil.getCurrentLoginMemberAccount(request.getSession()))
                        .build()
        );
    }

}

