package com.mushan.dao;

import com.mushan.dao.impl.ClassifyDaoImpl;
import com.mushan.pojo.Classify;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

public class ClassifyDaoTest {

    private ClassifyDao classifyDao = new ClassifyDaoImpl();

    @Test
    public void addUser() {
        System.out.println(classifyDao.addClassify(new Classify(null, "测试", (short) 0, "logo.png")));
    }

    @Test
    public void deleteClassify() {
        classifyDao.deleteClassify(1);
    }

    @Test
    public void updateClassify() {
        classifyDao.updateClassify(new Classify(2, "测试2", (short) 1, "logo2.png"));
    }

    @Test
    public void queryClassify() {
        System.out.println(classifyDao.queryClassify(2));
    }

    @Test
    public void queryClassifyCount() {
        System.out.println(classifyDao.queryClassifyCount());
    }

    @Test
    public void queryLimitClassify() {
        List<Classify> classifies = classifyDao.queryLimitClassify(0, 5);
        for (int i = 0; i < classifies.size(); i++) {
            System.out.println(classifies.get(i));
        }
    }
}