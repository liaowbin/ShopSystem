package com.mushan.web;

import com.mushan.common.utils.WebUtils;
import com.mushan.pojo.Classify;
import com.mushan.pojo.Goods;
import com.mushan.pojo.Page;
import com.mushan.service.ClassifyService;
import com.mushan.service.GoodsService;
import com.mushan.service.impl.ClassifyServiceImpl;
import com.mushan.service.impl.GoodsServiceImpl;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "GoodsServlet", value = "/GoodsServlet")
public class GoodsServlet extends BaseServlet {

    private GoodsService goodsService = new GoodsServiceImpl();

    private ClassifyService classifyService = new ClassifyServiceImpl();

    /**
     * 添加商品
     * @param req
     * @param resp
     */
    public void addGoods(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // 判断是否是多段数据（只有多段数据才是文件上传）
        if (ServletFileUpload.isMultipartContent(req)) {
            // 创建 FileItemFactory 工厂实现类
            FileItemFactory fileItemFactory = new DiskFileItemFactory();
            // 创建用于解析上传数据的工具类 ServletFileUpload 类
            ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);

            Map<String, Object> map = new HashMap<>();
            try {
                // 解析上传的数据，得到每一个表单项 FileItem
                List<FileItem> list = servletFileUpload.parseRequest(req);
                // 循环判断，每一个表单项，是普通类型，还是上传的文件
                for (FileItem fileItem : list) {
                    if (fileItem.isFormField()) {
                        map.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
                    } else {
                        // 上传的文件

                        // 给图片重命名(年月日时分秒时间戳)
                        Calendar now = Calendar.getInstance();
                        StringBuilder str = new StringBuilder();
                        str.append(now.get(Calendar.YEAR))
                            .append((now.get(Calendar.MONTH) + 1) + "")
                            .append(now.get(Calendar.DAY_OF_MONTH))
                            .append(now.get(Calendar.HOUR_OF_DAY))
                            .append(now.get(Calendar.MINUTE))
                            .append(now.get(Calendar.SECOND))
                            .append(new Date().getTime());

                        // 获取上传文件后缀
                        String suffix = fileItem.getName();
                        suffix = suffix.substring(suffix.lastIndexOf("."));

                        // 获取工程部署后在服务器硬盘上的绝对路径
                        String path = getServletContext().getRealPath("/");

                        // 下载
                        fileItem.write(new File(path + "admin\\uploads\\up\\" + str.toString() + suffix));

                        map.put("img", str.toString() + suffix);
                        System.out.println(path + "admin\\uploads\\up\\" + str.toString() + suffix);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            // 生成JavaBean
            Goods goods = WebUtils.copyJavaBean(map, new Goods());
            // 添加商品
            goodsService.addGoods(goods);

            try {
                req.getRequestDispatcher("GoodsServlet?action=queryGoodsAll").forward(req, resp);
            } catch (ServletException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 根据id查询指定商品
     * @param req
     * @param resp
     */
    public void queryGoods(HttpServletRequest req, HttpServletResponse resp) {

        // 设置当前导航
        HttpSession session = req.getSession();
        session.setAttribute("tabActive", "goods");

        Integer id = WebUtils.strToInteger(req.getParameter("id"), 0);
        Goods goods = goodsService.queryGoods(id);

        req.setAttribute("goods", goods);
        try {
            req.getRequestDispatcher("admin/goods_add.jsp").forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 修改商品
     * @param req
     * @param resp
     */
    public void updateGoods(HttpServletRequest req, HttpServletResponse resp) {

        // 设置当前导航
        HttpSession session = req.getSession();
        session.setAttribute("tabActive", "goods");

        // 判断是否是多段数据（只有多段数据才是文件上传）
        if (ServletFileUpload.isMultipartContent(req)) {
            // 创建 FileItemFactory 工厂实现类
            FileItemFactory fileItemFactory = new DiskFileItemFactory();
            // 创建用于解析上传数据的工具类 ServletFileUpload 类
            ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);

            Map<String, Object> map = new HashMap<>();
            try {
                // 解析上传的数据，得到每一个表单项 FileItem
                List<FileItem> list = servletFileUpload.parseRequest(req);
                // 循环判断，每一个表单项，是普通类型，还是上传的文件
                for (FileItem fileItem : list) {
                    if (fileItem.isFormField()) {
                        map.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
                    } else {
                        // 上传的文件
                        if (fileItem.getName() == null || "".equals(fileItem.getName())) {
                            continue;
                        }
                        // 给图片重命名(年月日时分秒时间戳)
                        Calendar now = Calendar.getInstance();
                        StringBuilder str = new StringBuilder();
                        str.append(now.get(Calendar.YEAR))
                                .append((now.get(Calendar.MONTH) + 1) + "")
                                .append(now.get(Calendar.DAY_OF_MONTH))
                                .append(now.get(Calendar.HOUR_OF_DAY))
                                .append(now.get(Calendar.MINUTE))
                                .append(now.get(Calendar.SECOND))
                                .append(new Date().getTime());
                        // 获取上传文件后缀
                        String suffix = fileItem.getName();
                        suffix = suffix.substring(suffix.lastIndexOf("."));
                        // 获取工程部署后在服务器硬盘上的绝对路径
                        String path = getServletContext().getRealPath("/");
                        // 下载
                        fileItem.write(new File(path + "admin\\uploads\\up\\" + str.toString() + suffix));
                        map.put("img", str.toString() + suffix);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            // 判断用户是否修改图片，如果没有修改图片把之前的图片路径添加进img
            if (!map.containsKey("img")) {
                map.put("img", map.get("imgName"));
            }

            // 生成JavaBean
            Goods goods = WebUtils.copyJavaBean(map, new Goods());

            System.out.println(goods);

            // 添加商品
            goodsService.updateGoods(goods);

            try {
                req.getRequestDispatcher("GoodsServlet?action=queryGoodsAll").forward(req, resp);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }

    /**
     * 查询指定分类下的所有商品
     * @param req
     * @param resp
     */
    public void queryGoodsByClassifyId(HttpServletRequest req, HttpServletResponse resp) {

        // 设置当前导航
        HttpSession session = req.getSession();
        session.setAttribute("tabActive", "goods");

        // 获取当前页和每页显示数据的条数
        Integer pageNo = WebUtils.strToInteger(req.getParameter("pageNo"), 1);
        Integer pageSize = WebUtils.strToInteger(req.getParameter("pageSize"), Page.PAGE_SIZE);

        Integer classifyId = WebUtils.strToInteger(req.getParameter("classifyId"), 0);

        Page<Goods> page = new Page<>();

        page.setPageNo(pageNo);
        page.setPageSize(pageSize);
        page.setDataTotalCount(goodsService.queryGoodsByClassifyIdCount(classifyId));

        int num = page.getDataTotalCount() / page.getPageSize();

        if (page.getDataTotalCount() % page.getPageSize() != 0) {
            num += 1;
        }
        page.setPageTotal(num);
        page.setUrl("GoodsServlet?action=queryGoodsByClassifyId");
        page.setItems(goodsService.queryGoodsByClassifyId((page.getPageNo() - 1) * page.getPageSize(), page.getPageSize(), classifyId));

        // 把page设置到域中
        req.setAttribute("page", page);

        try {
            req.getRequestDispatcher("admin/goods_list.jsp").forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 查询所有商品
     * @param req
     * @param resp
     */
    public void queryGoodsAll(HttpServletRequest req, HttpServletResponse resp) {

        // 设置当前导航
        HttpSession session = req.getSession();
        session.setAttribute("tabActive", "goods");

        // 获取当前页和每页显示数据的条数
        Integer pageNo = WebUtils.strToInteger(req.getParameter("pageNo"), 1);
        Integer pageSize = WebUtils.strToInteger(req.getParameter("pageSize"), Page.PAGE_SIZE);


        Page<Goods> page = new Page<>();

        page.setPageNo(pageNo);
        page.setPageSize(pageSize);
        page.setDataTotalCount(goodsService.queryGoodsAllCount());

        int num = page.getDataTotalCount() / page.getPageSize();

        if (page.getDataTotalCount() % page.getPageSize() != 0) {
            num += 1;
        }
        page.setPageTotal(num);
        page.setUrl("GoodsServlet?action=queryGoodsAll");
        page.setItems(goodsService.queryGoodsAll((page.getPageNo() - 1) * page.getPageSize(), page.getPageSize()));

        // 把page设置到域中
        req.setAttribute("page", page);

        try {
            req.getRequestDispatcher("admin/goods_list.jsp").forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 删除指定商品
     * @param req
     * @param resp
     */
    public void deleteGoods(HttpServletRequest req, HttpServletResponse resp) {
        Integer id = WebUtils.strToInteger(req.getParameter("id"), 0);
        goodsService.deleteGoods(id);

        try {
            req.getRequestDispatcher("GoodsServlet?action=queryGoodsAll").forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * 查询所有分类
     * @param req
     * @param resp
     */
    public void queryAllClassify(HttpServletRequest req, HttpServletResponse resp) {

        // 设置当前导航
        HttpSession session = req.getSession();
        session.setAttribute("tabActive", "goods");

        resp.setContentType("text/html;charset=UTF-8");

        List<Classify> classifies = classifyService.queryAllClassify();

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("classify", classifies);

        try {
            resp.getWriter().write(jsonObject.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
