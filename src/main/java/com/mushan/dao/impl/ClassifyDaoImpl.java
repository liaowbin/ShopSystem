package com.mushan.dao.impl;

import com.mushan.dao.BaseDao;
import com.mushan.dao.ClassifyDao;
import com.mushan.pojo.Classify;
import com.mushan.pojo.User;

import java.util.List;

public class ClassifyDaoImpl extends BaseDao implements ClassifyDao {
    @Override
    public int addClassify(Classify classify) {
        String sql = "insert into s_classify(`name`, `logo`, `is_show`) values(?, ?, ?)";
        return update(sql, classify.getName(), classify.getLogo(), classify.getIsShow());
    }

    @Override
    public int deleteClassify(Integer id) {
        String sql = "delete from s_classify where id = ?";
        return update(sql, id);
    }

    @Override
    public int updateClassify(Classify classify) {
        String sql = "update s_classify set `name` = ?, `logo` = ?, `is_show` = ? where id = ?";
        return update(sql, classify.getName(), classify.getLogo(), classify.getIsShow(), classify.getId());
    }

    @Override
    public Classify queryClassify(Integer id) {
        String sql = "select `id`, `name`, `logo`, `is_show` isShow from s_classify where id = ?";
        return queryForOne(Classify.class, sql, id);
    }

    @Override
    public int queryClassifyCount() {
        String sql = "select count(*) from s_classify";
        Number o = (Number) queryForSingleValue(sql);
        return o.intValue();
    }

    @Override
    public List<Classify> queryLimitClassify(int begin, int pageSize) {
        String sql = "select `id`, `name`, `logo`, `is_show` isShow from s_classify limit ?, ?";
        return queryForAll(Classify.class, sql, begin, pageSize);
    }

    @Override
    public List<Classify> queryAllClassify() {
        String sql = "select `id`, `name` from s_classify";
        return queryForAll(Classify.class, sql);
    }
}
