package com.mushan.dao.impl;

import com.mushan.dao.BaseDao;
import com.mushan.dao.UserDao;
import com.mushan.pojo.User;

import java.util.List;

public class UserDaoImpl extends BaseDao implements UserDao {
    @Override
    public User login(String username, String password) {
        String sql = "select `id`,`username`,`password`,`phone`,`sex`, `user_type` userType from s_user where username = ? and password = ?";
        return queryForOne(User.class, sql, username, password);
    }

    @Override
    public int addUser(User user) {
        String sql = "insert into s_user(`username`, `password`, `phone`, `sex`, `user_type`) values (?,?,?,?,?)";
        return update(sql, user.getUsername(), user.getPassword(), user.getPhone(), user.getSex(), user.getUserType());
    }

    @Override
    public int deleteUser(Integer id) {
        String sql = "delete from s_user where id = ?";
        return update(sql, id);
    }

    @Override
    public int updateUser(User user) {
        String sql = "update s_user set `username`=?, `password`=?, `phone`=?, `sex`= ?, `user_type`=? where id = ?";
        return update(sql, user.getUsername(), user.getPassword(), user.getPhone(), user.getSex(), user.getUserType(), user.getId());
    }

    @Override
    public User queryUser(Integer id) {
        String sql = "select `id`,`username`,`password`,`phone`,`sex`, `user_type` userType from s_user where id = ?";
        return queryForOne(User.class, sql, id);
    }

    @Override
    public User queryUserByUsername(String username) {
        String sql = "select `id`, `username`, `password`, `phone`, `sex`, `user_type` userType from s_user where username = ?";
        return queryForOne(User.class, sql, username);
    }

    @Override
    public List<User> queryUserList() {
        String sql = "select `id`,`username`,`password`,`phone`,`sex`, `user_type` userType from s_user";
        return queryForAll(User.class, sql);
    }

    @Override
    public List<User> queryUserBySearch(String str) {
        String sql = "select `id`,`username`,`password`,`phone`,`sex`, `user_type` userType from s_user where username regexp (?)";
        return queryForAll(User.class, sql, str);
    }

    @Override
    public int queryUserCount() {
        String sql = "select count(*) from s_user";
        Number val = (Number) queryForSingleValue(sql);
        return val.intValue();
    }

    @Override
    public List<User> queryLimitUser(int begin, int pageSize) {
        String sql = "select `id`,`username`,`password`,`phone`,`sex`, `user_type` userType from s_user limit ?,?";
        return queryForAll(User.class, sql, begin, pageSize);
    }
}
