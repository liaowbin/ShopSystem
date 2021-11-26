package com.mushan.service.impl;

import com.mushan.dao.ClassifyDao;
import com.mushan.dao.impl.ClassifyDaoImpl;
import com.mushan.pojo.Classify;
import com.mushan.pojo.Page;
import com.mushan.service.ClassifyService;

import java.util.List;

public class ClassifyServiceImpl implements ClassifyService {
    private ClassifyDao classifyDao = new ClassifyDaoImpl();
    @Override
    public int addClassify(Classify classify) {
        return classifyDao.addClassify(classify);
    }

    @Override
    public int deleteClassify(Integer id) {
        return classifyDao.deleteClassify(id);
    }

    @Override
    public int updateClassify(Classify classify) {
        return classifyDao.updateClassify(classify);
    }

    @Override
    public Classify queryClassify(Integer id) {
        return classifyDao.queryClassify(id);
    }

    @Override
    public Page<Classify> queryPage(int pageNo, int pageSize, String url) {
        Page<Classify> page = new Page<>();

        page.setUrl(url);

        page.setPageNo(pageNo);

        page.setPageSize(pageSize);

        page.setDataTotalCount(classifyDao.queryClassifyCount());

        int num = page.getDataTotalCount() / page.getPageSize();

        if (page.getDataTotalCount() % page.getPageSize() != 0) {
            num += 1;
        }

        page.setPageTotal(num);

        System.out.println((page.getPageNo() - 1));
        System.out.println(page.getPageSize());

        page.setItems(classifyDao.queryLimitClassify((page.getPageNo() - 1) * page.getPageSize(), page.getPageSize()));

        return page;
    }

    @Override
    public List<Classify> queryAllClassify() {
        return classifyDao.queryAllClassify();
    }
}
