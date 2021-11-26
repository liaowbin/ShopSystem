package com.mushan.dao;

import com.mushan.common.utils.JDBCUtil;
import com.mysql.jdbc.Connection;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public abstract class BaseDao {

    // 使用DbUtils操作数据库
    private QueryRunner queryRunner = new QueryRunner();

    /**
     * 用来执行 insert/update/delete 语句
     * @param sql
     * @param args
     * @return 如果返回 -1 表示执行失败，返回其它表示影响的行数
     */
    public int update(String sql, Object ...args) {
        Connection conn = JDBCUtil.getConnection();
        try {
            return queryRunner.update(conn, sql, args);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtil.close(conn);
        }
        return -1;
    }

    /**
     * 查询返回一个javaBean的sql语句
     * @param type 返回的对象类型
     * @param sql sql语句
     * @param args 参数
     * @param <T> 返回类型的泛型
     * @return
     */
    public <T> T queryForOne(Class<T> type, String sql, Object ...args) {
        Connection conn = JDBCUtil.getConnection();
        try {
            return queryRunner.query(conn, sql, new BeanHandler<T>(type), args);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtil.close(conn);
        }
        return null;
    }

    /**
     * 查询返回多个javaBean的sql语句
     * @param type 返回的对象类型
     * @param sql sql语句
     * @param args 参数
     * @param <T> 返回类型的泛型
     * @return
     */
    public <T> List<T> queryForAll(Class<T> type, String sql, Object ...args) {
        Connection conn = JDBCUtil.getConnection();
        try {
            return queryRunner.query(conn, sql, new BeanListHandler<T>(type), args);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtil.close(conn);
        }
        return null;
    }

    /**
     * 执行返回一行一列的sql语句
     * @param sql sql语句
     * @param args sql对应的参数
     * @return
     */
    public Object queryForSingleValue(String sql, Object ...args) {
        Connection conn = JDBCUtil.getConnection();
        try {
            return queryRunner.query(conn, sql, new ScalarHandler<>(), args);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
