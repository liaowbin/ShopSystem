package com.mushan.service;

import com.mushan.pojo.Classify;
import com.mushan.service.impl.ClassifyServiceImpl;
import org.junit.Test;

import static org.junit.Assert.*;

public class ClassifyServiceTest {

    private ClassifyService classifyService = new ClassifyServiceImpl();

    @Test
    public void addClassify() {
        System.out.println(classifyService.addClassify(new Classify(null, "内裤", (short) 1, "neiku.png")));
    }

    @Test
    public void deleteClassify() {
        System.out.println(classifyService.deleteClassify(4));
    }

    @Test
    public void updateClassify() {
        System.out.println(classifyService.updateClassify(new Classify(3, "内裤", (short) 1, "neiku.png")));
    }

    @Test
    public void queryPage() {
        System.out.println(classifyService.queryPage(1, 4, "test?action=assa"));
    }
}