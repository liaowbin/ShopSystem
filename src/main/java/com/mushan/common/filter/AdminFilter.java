package com.mushan.common.filter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "AdminFilter", urlPatterns = "")
public class AdminFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        Object userInfo = httpServletRequest.getSession().getAttribute("userInfo");
        if (userInfo == null) {
            System.out.println(httpServletRequest.getContextPath() + "/login.jsp");
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/login.jsp");
        }else {
            chain.doFilter(request, response);
        }
    }
}
