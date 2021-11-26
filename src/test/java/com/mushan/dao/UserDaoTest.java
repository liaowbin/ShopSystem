package com.mushan.dao;

import com.mushan.dao.impl.UserDaoImpl;
import com.mushan.pojo.User;

import java.util.List;

import static org.junit.Assert.*;

public class UserDaoTest {

    UserDao userDao = new UserDaoImpl();

    @org.junit.Test
    public void login() {
        System.out.println(userDao.login("admin", "admin"));
        System.out.println(userDao.login("admin", "123456"));
    }

    @org.junit.Test
    public void addUser() {
        System.out.println(userDao.addUser(new User(null, "xiaomei", "123456", "115", "男", "0")));
    }

    @org.junit.Test
    public void deleteUser() {
        System.out.println(userDao.deleteUser(2));
    }

    @org.junit.Test
    public void updateUser() {
        System.out.println(userDao.updateUser(new User(1, "admin", "123456", "15179733569", "男", "0")));
    }

    @org.junit.Test
    public void queryUser() {
        System.out.println(userDao.queryUser(1));
    }

    @org.junit.Test
    public void queryUserList() {
        System.out.println(userDao.queryUserList());
    }

    @org.junit.Test
    public void queryUserCount() {
        System.out.println(userDao.queryUserCount());
    }

    @org.junit.Test
    public void queryLimitUser() {
        List<User> users = userDao.queryLimitUser(4, 4);
        for (User user : users) {
            System.out.println(user);
        }
    }
}
