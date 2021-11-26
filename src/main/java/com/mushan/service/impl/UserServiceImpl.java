package com.mushan.service.impl;

import com.mushan.dao.UserDao;
import com.mushan.dao.impl.UserDaoImpl;
import com.mushan.pojo.Page;
import com.mushan.pojo.User;
import com.mushan.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {

    private UserDao userDao = new UserDaoImpl();

    @Override
    public User login(String username, String password) {
        return userDao.login(username, password);
    }

    @Override
    public List<User> queryUserList() {
        return userDao.queryUserList();
    }

    @Override
    public int addUser(User user) {
        return userDao.addUser(user);
    }

    @Override
    public User queryUser(int id) {
        return userDao.queryUser(id);
    }

    @Override
    public int updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public int deleteUser(int id) {
        return userDao.deleteUser(id);
    }

    @Override
    public boolean userNameIsUsable(String username) {
        User user = userDao.queryUserByUsername(username);
        if (user == null) {
            return true;
        }else {
            return false;
        }
    }

    @Override
    public List<User> queryUserBySearch(String str) {
        return userDao.queryUserBySearch(str);
    }

    @Override
    public Page queryPage(int pageNo, int pageSize, String url) {
        Page page = new Page();
        // 当前页数
        page.setPageNo(pageNo);
        // 每页几条数据
        page.setPageSize(pageSize);
        // 总条数
        page.setDataTotalCount(userDao.queryUserCount());
        // 总页数
        int num = 0;
        if (page.getDataTotalCount() % page.getPageSize() != 0) {
            num = (page.getDataTotalCount() / page.getPageSize()) + 1;
        }else {
            num = page.getDataTotalCount() / page.getPageSize();
        }
        page.setPageTotal(num);
        // 当前页数据
        List<User> users = userDao.queryLimitUser((page.getPageNo() - 1) * page.getPageSize(), page.getPageSize());
        page.setItems(users);
        // 调转地址
        page.setUrl(url);

        return page;
    }
}
