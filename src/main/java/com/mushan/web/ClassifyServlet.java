package com.mushan.web;

import com.mushan.common.utils.WebUtils;
import com.mushan.pojo.Classify;
import com.mushan.pojo.Page;
import com.mushan.pojo.User;
import com.mushan.service.ClassifyService;
import com.mushan.service.impl.ClassifyServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "/ClassifyServlet", value = "/ClassifyServlet")
public class ClassifyServlet extends BaseServlet {
    private ClassifyService classifyService = new ClassifyServiceImpl();
    /**
     * 分页
     * @param req
     * @param resp
     */
    public void page(HttpServletRequest req, HttpServletResponse resp) {

        // 设置当前导航
        HttpSession session = req.getSession();
        session.setAttribute("tabActive", "classify");

        Integer pageNo = WebUtils.strToInteger(req.getParameter("pageNo"), 1);
        Integer pageSize = WebUtils.strToInteger(req.getParameter("pageSize"), Page.PAGE_SIZE);

        Page page = classifyService.queryPage(pageNo, pageSize, "ClassifyServlet?action=page");

        req.setAttribute("page", page);

        try {
            req.getRequestDispatcher("admin/category.jsp").forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 根据id查询指定分类
     * @param req
     * @param resp
     */
    public void queryClassify(HttpServletRequest req, HttpServletResponse resp) {
        // 获取id
        String id = req.getParameter("id");
        // 根据id查询用户
        Classify classify = classifyService.queryClassify(WebUtils.strToInteger(id, 0));

        System.out.println(classify);

        req.setAttribute("classify", classify);
        try {
            req.getRequestDispatcher("admin/category_add.jsp").forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 添加分类
     * @param req
     * @param resp
     */
    public void addClassify(HttpServletRequest req, HttpServletResponse resp) {
        Classify classify = WebUtils.copyJavaBean(req.getParameterMap(), new Classify());
        classifyService.addClassify(classify);

        try {
            req.getRequestDispatcher("ClassifyServlet?action=page").forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 修改类别
     * @param req
     * @param resp
     */
    public void updateClassify(HttpServletRequest req, HttpServletResponse resp) {
        Classify classify = WebUtils.copyJavaBean(req.getParameterMap(), new Classify());
        classifyService.updateClassify(classify);
        try {
            resp.sendRedirect("ClassifyServlet?action=page");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 删除指定类别
     * @param req
     * @param resp
     */
    public void deleteClassify(HttpServletRequest req, HttpServletResponse resp) {
        classifyService.deleteClassify(WebUtils.strToInteger(req.getParameter("id"), 0));
        try {
            resp.sendRedirect("ClassifyServlet?action=page");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
