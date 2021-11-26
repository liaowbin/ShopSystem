## 项目描述

该项目使用三层架构编写，通过反射对Servlet程序进行封装、对数据的操作用BeanUtils工具类进行了封装、文件上传、封装分页等，用到的技术点有：Servlet程序、反射、jsp页面、EL表达式、JSTL标签库、Session会话、JSON使用、Ajax请求等。项目的功能比较简单，比较合适拿来学习，所有界面来源于github，如果想完善这个项目的可以进行二开。

## 项目准备

### 使用IDEA导入项目

导入后用Maven下载jar包
![使用IDEA导入项目](https://blog-1256986541.cos.ap-nanjing.myqcloud.com/shop_system/2021-11-26_09-21-48.png)

### 配置tomcat
![配置tomcat](https://blog-1256986541.cos.ap-nanjing.myqcloud.com/shop_system/2021-11-26_09-25-41.png)

### 数据导入到数据库
### ![配置tomcat](https://blog-1256986541.cos.ap-nanjing.myqcloud.com/shop_system/2021-11-26_20-14-28.png)



### 修改配置文件

修改项目 ShopSystem/src/main/resources/db.properties 参数

```properties
driver=com.mysql.jdbc.Driver
url=jdbc:mysql://localhost:3306/shop
user=root
password=
```

运行项目 
![](https://blog-1256986541.cos.ap-nanjing.myqcloud.com/shop_system/2021-11-26_09-34-39.png)

## 项目效果

### 登录
导入了数据库可用账号 admin 密码 123456 登录
![登录](https://blog-1256986541.cos.ap-nanjing.myqcloud.com/shop_system/2021-11-26_09-36-10.png)

### 用户管理
![](https://blog-1256986541.cos.ap-nanjing.myqcloud.com/shop_system/2021-11-26_09-39-54.png)

### 分类管理
![](https://blog-1256986541.cos.ap-nanjing.myqcloud.com/shop_system/2021-11-26_09-40-31.png)

### 商品管理
![](https://blog-1256986541.cos.ap-nanjing.myqcloud.com/shop_system/2021-11-26_09-41-19.png)
