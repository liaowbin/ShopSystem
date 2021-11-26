package com.mushan.dao;

import com.mushan.pojo.Classify;
import com.mushan.pojo.User;

import java.util.List;

public interface ClassifyDao {
    /**
     * 增加一个类别
     * @param classify
     * @return
     */
    public int addClassify(Classify classify);

    /**
     * 根据id删除指定类别
     * @param id
     * @return
     */
    public int deleteClassify(Integer id);

    /**
     * 修改类别
     * @param classify
     * @return
     */
    public int updateClassify(Classify classify);

    /**
     * 根据id查找类别
     * @param id
     * @return
     */
    public Classify queryClassify(Integer id);

    /**
     * 查询有多少个类别
     * @return
     */
    public int queryClassifyCount();

    /**
     * 分页
     * @param begin
     * @param pageSize
     * @return
     */
    public List<Classify> queryLimitClassify(int begin, int pageSize);


    /**
     * 查询所有分类（id，名称）
     * @return
     */
    public List<Classify> queryAllClassify();
}
