package com.mushan.service.impl;

import com.mushan.dao.GoodsDao;
import com.mushan.dao.impl.GoodsDaoImpl;
import com.mushan.pojo.Goods;
import com.mushan.service.ClassifyService;
import com.mushan.service.GoodsService;

import java.util.List;

public class GoodsServiceImpl implements GoodsService {

    private GoodsDao goodsDao = new GoodsDaoImpl();

    private ClassifyService classifyService = new ClassifyServiceImpl();

    @Override
    public int addGoods(Goods goods) {
        return goodsDao.addGoods(goods);
    }

    @Override
    public int deleteGoods(Integer id) {
        return goodsDao.deleteGoods(id);
    }

    @Override
    public int updateGoods(Goods goods) {
        return goodsDao.updateGoods(goods);
    }

    @Override
    public Goods queryGoods(Integer id) {
        return goodsDao.queryGoods(id);
    }

    @Override
    public List<Goods> queryGoodsByClassifyId(int begin, int pageSize, Integer classifyId) {
        return goodsDao.queryGoodsByClassifyId(begin, pageSize, classifyId);
    }

    @Override
    public int queryGoodsByClassifyIdCount(Integer classifyId) {
        return goodsDao.queryGoodsByClassifyIdCount(classifyId);
    }

    @Override
    public List<Goods> queryGoodsAll(int begin, int pageSize) {
        List<Goods> goods = goodsDao.queryGoodsAll(begin, pageSize);
        // 根据classify_id查出对应分类名称
        for (Goods good : goods) {
            good.setClassifyName(classifyService.queryClassify(good.getClassifyId()).getName());
        }
        return goods;
    }

    @Override
    public int queryGoodsAllCount() {
        return goodsDao.queryGoodsAllCount();
    }
}
