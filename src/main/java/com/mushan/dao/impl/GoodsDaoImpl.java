package com.mushan.dao.impl;

import com.mushan.dao.BaseDao;
import com.mushan.dao.GoodsDao;
import com.mushan.pojo.Goods;

import java.util.List;

public class GoodsDaoImpl extends BaseDao implements GoodsDao {
    @Override
    public int addGoods(Goods goods) {
        String sql = "insert into s_goods(`title`, `price`, `stock`, `img`, `classify_id`, `describe`) values(?,?,?,?,?,?)";
        return update(sql, goods.getTitle(), goods.getPrice(), goods.getStock(), goods.getImg(), goods.getClassifyId(), goods.getDescribe());
    }

    @Override
    public int deleteGoods(Integer id) {
        String sql = "delete from s_goods where id = ?";
        return update(sql, id);
    }

    @Override
    public int updateGoods(Goods goods) {
        String sql = "update s_goods set `title` = ?, `price` = ?, `stock` = ?, `img` = ?, `classify_id` = ?, `describe` = ? where id = ?";
        return update(sql, goods.getTitle(), goods.getPrice(), goods.getStock(), goods.getImg(), goods.getClassifyId(), goods.getDescribe(), goods.getId());
    }

    @Override
    public Goods queryGoods(Integer id) {
        String sql = "select `id`, `title`, `price`, `stock`, `img`, `classify_id` classifyId, `describe` from s_goods where id = ?";
        return queryForOne(Goods.class, sql, id);
    }

    @Override
    public List<Goods> queryGoodsByClassifyId(int begin, int pageSize, Integer classifyId) {
        String sql = "select `id`, `title`, `price`, `stock`, `img`, `classify_id` classifyId, `describe` from s_goods where classify_id = ? limit ?, ?";
        return queryForAll(Goods.class, sql, classifyId, begin, pageSize);
    }

    @Override
    public int queryGoodsByClassifyIdCount(Integer classifyId) {
        String sql = "select count(*) from s_goods where classify_id = ?";
        Number o = (Number) queryForSingleValue(sql, classifyId);
        return o.intValue();
    }

    @Override
    public List<Goods> queryGoodsAll(int begin, int pageSize) {
        String sql = "select `id`, `title`, `price`, `stock`, `img`, `classify_id` classifyId, `describe` from s_goods limit ?, ?";
        return queryForAll(Goods.class, sql, begin, pageSize);
    }

    @Override
    public int queryGoodsAllCount() {
        String sql = "select count(*) from s_goods";
        Number o = (Number) queryForSingleValue(sql);
        return o.intValue();
    }
}
