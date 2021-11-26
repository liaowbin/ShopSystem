package com.mushan.web;

import com.mushan.common.utils.WebUtils;
import com.mushan.pojo.Page;
import com.mushan.pojo.User;
import com.mushan.service.UserService;
import com.mushan.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "UserServlet", value = "/UserServlet")
public class UserServlet extends BaseServlet {

    private UserService userService = new UserServiceImpl();

    /**
     * 用户登录
     * @param req
     * @param resp
     * @throws IOException
     */
    public void login(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        // 获取用户名&密码
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = userService.login(username, password);

        if (user == null) {
            // 密码或用户名错误，重定向到登录
            resp.sendRedirect("admin/login.jsp");
        }else {
            // 登录成功，把用户信息存到session
            HttpSession session = req.getSession();
            session.setAttribute("userInfo", user);
            resp.sendRedirect("admin/index.jsp");
        }
    }

    /**
     * 用户退出注销登录
     * @param req
     * @param resp
     */
    public void logout(HttpServletRequest req, HttpServletResponse resp) {
        // 让session立马销毁重定向到登录页面
        HttpSession session = req.getSession();
        session.invalidate();
        try {
            resp.sendRedirect("index.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 查询所有用户
     * @param req
     * @param resp
     */
    public void queryAllUser(HttpServletRequest req, HttpServletResponse resp) {
        try {
            // 查询出所有用户，把数据存储到request域中，再重定向
            List<User> users = userService.queryUserList();
            req.setAttribute("userList", users);
            req.getRequestDispatcher("admin/user_list.jsp").forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 添加用户
     * @param req
     * @param resp
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     */
    public void addUser(HttpServletRequest req, HttpServletResponse resp) throws InvocationTargetException, IllegalAccessException {
        // 获取用户填写的数据 封装成一个bean
        User user = WebUtils.copyJavaBean(req.getParameterMap(), new User());
        userService.addUser(user);
        try {
            resp.sendRedirect("UserServlet?action=queryAllUser");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 查询一个用户
     * @param req
     * @param resp
     */
    public void queryUser(HttpServletRequest req, HttpServletResponse resp) {

        // 设置当前导航
        HttpSession session = req.getSession();
        session.setAttribute("tabActive", "user");

        // 获取id
        String id = req.getParameter("id");
        // 根据id查询用户
        User user = userService.queryUser(WebUtils.strToInteger(id, 0));
        req.setAttribute("user", user);
        try {
            req.getRequestDispatcher("admin/user_add.jsp").forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 修改指定用户
     * @param req
     * @param resp
     */
    public void updateUser(HttpServletRequest req, HttpServletResponse resp) {
        User user = WebUtils.copyJavaBean(req.getParameterMap(), new User());
        userService.updateUser(user);
        try {
            resp.sendRedirect("UserServlet?action=page");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 删除用户
     * @param req
     * @param resp
     */
    public void deleteUser(HttpServletRequest req, HttpServletResponse resp) {
        userService.deleteUser(WebUtils.strToInteger(req.getParameter("id"), 0));
        try {
            resp.sendRedirect("UserServlet?action=page");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 查询用户名是否可用
     * @param req
     * @param resp
     */
    public void queryNameIsUsable(HttpServletRequest req, HttpServletResponse resp) {

        JSONObject jsonObject = new JSONObject();

        jsonObject.put("name", userService.userNameIsUsable(req.getParameter("username")));

        try {
            resp.getWriter().write(jsonObject.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * 搜索用户
     * @param req
     * @param resp
     */
    public void search(HttpServletRequest req, HttpServletResponse resp) {

        resp.setContentType("text/html;charset=UTF-8");

        List<User> userList = userService.queryUserBySearch(req.getParameter("search"));

        JSONObject jsonObject = new JSONObject();

        jsonObject.put("data", userList);

        try {
            resp.getWriter().write(jsonObject.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 分页查询
     * @param req
     * @param resp
     */
    public void page(HttpServletRequest req, HttpServletResponse resp) {

        // 设置当前导航
        HttpSession session = req.getSession();
        session.setAttribute("tabActive", "user");

        Integer pageNo = WebUtils.strToInteger(req.getParameter("pageNo"), 1);
        Integer pageSize = WebUtils.strToInteger(req.getParameter("pageSize"), Page.PAGE_SIZE);
        String url = "UserServlet?action=page";

        if (pageNo == null) {
            pageNo = 1;
        }

        Page page = userService.queryPage(pageNo, pageSize, url);


        req.setAttribute("page", page);
        try {
            req.getRequestDispatcher("admin/user_list.jsp").forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
