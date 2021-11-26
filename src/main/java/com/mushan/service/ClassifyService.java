package com.mushan.service;

import com.mushan.dao.ClassifyDao;
import com.mushan.pojo.Classify;
import com.mushan.pojo.Page;

import java.util.List;

public interface ClassifyService {
    /**
     * 添加分类
     * @param classify
     * @return
     */
    public int addClassify(Classify classify);

    /**
     * 删除指定分类
     * @param id
     * @return
     */
    public int deleteClassify(Integer id);

    /**
     * 修改指定分类
     * @param classify
     * @return
     */
    public int updateClassify(Classify classify);

    /**
     * 根据id查找指定分类
     * @param id
     * @return
     */
    public Classify queryClassify(Integer id);

    /**
     * 返回一个分页对象
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Page queryPage(int pageNo, int pageSize, String url);

    /**
     * 返回一个只有（id，name）的Classify对象
     * @return
     */
    public List<Classify> queryAllClassify();
}
