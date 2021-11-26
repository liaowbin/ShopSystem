package com.mushan.service;

import com.mushan.pojo.Page;
import com.mushan.pojo.User;

import java.util.List;

public interface UserService {
    /**
     * 用户登录
     * @param username
     * @param password
     * @return
     */
    public User login(String username, String password);

    /**
     * 查询所有用户
     * @return
     */
    public List<User> queryUserList();

    /**
     * 查询指定用户
     * @param id
     * @return
     */
    public User queryUser(int id);

    /**
     * 添加用户
     * @param user
     * @return
     */
    public int addUser(User user);

    /**
     * 修改（更新）一个用户
     * @param user
     * @return
     */
    public int updateUser(User user);

    /**
     * 删除指定用户
     * @param id
     * @return
     */
    public int deleteUser(int id);

    /**
     * 查询用户名是否可用
     * @param username
     * @return
     */
    public boolean userNameIsUsable(String username);

    /**
     * 搜索用户
     * @param str
     * @return
     */
    public List<User> queryUserBySearch(String str);

    /**
     * 用户分页
     * @param pageNo
     * @param pageSize
     * @param url
     * @return
     */

    public Page queryPage(int pageNo, int pageSize, String url);
}
