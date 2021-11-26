package com.mushan.dao;

import com.mushan.pojo.Goods;

import java.util.List;

public interface GoodsDao {
    /**
     * 添加商品
     * @param goods
     * @return
     */
    public int addGoods(Goods goods);

    /**
     * 删除商品
     * @param id
     * @return
     */
    public int deleteGoods(Integer id);

    /**
     * 修改商品
     * @param goods
     * @return
     */
    public int updateGoods(Goods goods);

    /**
     * 根据id查找商品
     * @param id
     * @return
     */
    public Goods queryGoods(Integer id);

    /**
     * 根据分类来查找商品
     * @param classifyId
     * @return
     */
    public List<Goods> queryGoodsByClassifyId(int begin, int pageSize, Integer classifyId);

    /**
     * 查询根据指定分类商品数量
     * @param classifyId
     * @return
     */
    public int queryGoodsByClassifyIdCount(Integer classifyId);

    /**
     * 查找全部商品
     * @return
     */
    public List<Goods> queryGoodsAll(int begin, int pageSize);

    /**
     * 查询所有商品数量
     * @return
     */
    public int queryGoodsAllCount();
}
