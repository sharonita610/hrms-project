package com.hrms.project4th.mvc.interceptor;

import com.hrms.project4th.mvc.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Configuration
@RequiredArgsConstructor
@Slf4j
public class MainIntercetor implements HandlerInterceptor {

    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler) throws IOException {

        //로그인을 했는지 확인 하고
        // 로그인을 안햇으면 강제로 리다이렉셪

        if(!LoginUtil.isLogin(request.getSession())){
        log.info("this request ( {} ) denied! ",request.getRequestURI());
        response.sendRedirect("/log-in");

        return false;

        }
        return true;
    }
}
