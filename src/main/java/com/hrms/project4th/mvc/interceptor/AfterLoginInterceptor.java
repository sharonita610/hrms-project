package com.hrms.project4th.mvc.interceptor;

import com.hrms.project4th.mvc.util.LoginUtil;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Configuration
public class AfterLoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws IOException {
        HttpSession session = request.getSession();

        if(LoginUtil.isLogin(session)){
            response.sendRedirect("/");
            return false;
        }
        return true;
    }

}
