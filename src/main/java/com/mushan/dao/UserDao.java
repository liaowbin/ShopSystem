package com.mushan.dao;

import com.mushan.pojo.User;

import java.util.List;

public interface UserDao {

    /**
     * 用户登录
     * @param username
     * @param password
     * @return
     */
    public User login(String username, String password);

    /**
     * 增加一个用户
     * @param user
     * @return
     */
    public int addUser(User user);

    /**
     * 根据id删除指定用户
     * @param id
     * @return
     */
    public int deleteUser(Integer id);

    /**
     * 修改用户
     * @param user
     * @return
     */
    public int updateUser(User user);

    /**
     * 根据id查找用户
     * @param id
     * @return
     */
    public User queryUser(Integer id);

    /**
     * 根据用户名查找用户
     * @param username
     * @return
     */
    public User queryUserByUsername(String username);

    /**
     * 搜索用户
     * @param str
     * @return
     */
    public List<User> queryUserBySearch(String str);

    /**
     * 查询所有用户（模糊查询）
     * @return
     */
    public List<User> queryUserList();

    /**
     * 查询有多少个用户
     * @return
     */
    public int queryUserCount();

    /**
     * 分页
     * @param begin
     * @param pageSize
     * @return
     */
    public List<User> queryLimitUser(int begin, int pageSize);

}
