package com.ncit.mybookstore.interceptor;

import com.ncit.mybookstore.model.User;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PermissInterceptor implements HandlerInterceptor {
    AntPathMatcher pathMatcher = new AntPathMatcher();

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestURI = request.getRequestURI();
        if ("/".equals(requestURI) || "/doLogin".equals(requestURI) || "/register".equals(requestURI)
                || "/doRegister".equals(requestURI) || "/login".equals(requestURI) || "/book".equals(requestURI)) {
            return true;
        }
        HttpSession session = request.getSession(true);
        User currentuser = (User) session.getAttribute("currentuser");

        if (currentuser != null) {
            return true;
        }else{
            response.sendRedirect("/");
            return false;
        }


//        if (pathMatcher.match("/admin/**", requestURI)) {
//            if (currentuser != null) {
//                if (currentuser.getId() == 2) {
//                    return true;
//                }else{
//                    response.getWriter().write("forbidden");
//                    return false;
//                }
//            }
//        } else {
//            if (currentuser != null) {
//                return true;
//            }
//        }
//        response.sendRedirect("/");
//        return false;
    }
}
