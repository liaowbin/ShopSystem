package com.mushan.service;

import com.mushan.pojo.Classify;
import com.mushan.pojo.Goods;
import com.mushan.service.impl.ClassifyServiceImpl;
import com.mushan.service.impl.GoodsServiceImpl;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

public class GoodsServiceTest {

    private GoodsService goodsService = new GoodsServiceImpl();

    private ClassifyService classifyService = new ClassifyServiceImpl();

    @Test
    public void addGoods() {
    }

    @Test
    public void deleteGoods() {
    }

    @Test
    public void updateGoods() {
    }

    @Test
    public void queryGoods() {
    }

    @Test
    public void queryGoodsByClassifyId() {
    }

    @Test
    public void queryGoodsByClassifyIdCount() {
    }

    @Test
    public void queryGoodsAll() {
        List<Goods> goods = goodsService.queryGoodsAll(0, 10);
        for (Goods good : goods) {
            good.setClassifyName(classifyService.queryClassify(good.getClassifyId()).getName());
            System.out.println(good);
        }
    }

    @Test
    public void queryGoodsAllCount() {
    }
}