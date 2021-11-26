package com.mushan.dao;

import com.mushan.dao.impl.GoodsDaoImpl;
import com.mushan.pojo.Goods;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.List;

import static org.junit.Assert.*;

public class GoodsDaoTest {
    private GoodsDao goodsDao = new GoodsDaoImpl();

    @Test
    public void addGoods() {
        int i = goodsDao.addGoods(new Goods(null, "Test", new BigDecimal(10.00), 10, "/upload/default.png", 3, "描述"));
        System.out.println(i);
    }

    @Test
    public void deleteGoods() {
        System.out.println(goodsDao.deleteGoods(1));
    }

    @Test
    public void updateGoods() {
        goodsDao.updateGoods(new Goods(2, "哈哈", new BigDecimal(99.99), 10, "/upload/default.png", 2, "描述2"));
    }

    @Test
    public void queryGoods() {
        System.out.println(goodsDao.queryGoods(2));
    }

    @Test
    public void queryGoodsByClassifyId() {
        List<Goods> goods = goodsDao.queryGoodsByClassifyId(0, 2, 2);
        for (Goods good : goods) {
            System.out.println(good);
        }
    }

    @Test
    public void queryGoodsByClassifyIdCount() {
        System.out.println(goodsDao.queryGoodsByClassifyIdCount(3));
    }

    @Test
    public void queryGoodsAll() {
        List<Goods> goods = goodsDao.queryGoodsAll(0, 3);
        for (Goods good : goods) {
            System.out.println(good);
        }
    }

    @Test
    public void queryGoodsAllCount() {
        System.out.println(goodsDao.queryGoodsAllCount());
    }
}