# Mysql

jEE企业级开发，web

前端（页面，展示数据）

后台 （连接点：连接数据库jdbc，连接前端（控制，控制视图跳转，给前端传递数据））

数据库 （存储数据）

需要学习: 操作系统，数据结构与算法，体系结构，编译原理，实战经验



## 1.1 为什么要学习数据库

1. 岗位需求
2. 现在的世界是一个大数据时代，数据是可以变现的（互联网时代下没有隐私）
3. 被迫需求：纯数据
4. **数据库是所有软件中最重要最核心的存在**   DBA

## 1.2 什么是数据库

数据库（DB，DataBase）

概念：数据仓库，安装在操作系统之上的软件，SQL，可以存贮大量的数据（500万一下，以上要优化）

作用：存储数据，管理数据

## 1.3  数据库分类

关系型数据库：

* Mysql，Oracle，sql server，DB2，SQLline
* 通过表和表之间，行和列之间的关系惊醒数据的存储，



非关系型数据库（no only sql）

* Redis,MongDB
* 非关系型数据库，对象存储，通过对象自身属性决定存储



**DBMS（数据库管理系统）**

* 数据库管理软件，科学的管理数据，维护和获得数据
* Mysql，数据库管理系统



## 1.4 MYSQL简介

MySQL是一个[关系型数据库管理系统](https://baike.baidu.com/item/关系型数据库管理系统/696511)

由瑞典MySQL AB 公司开发，如今属于 [Oracle](https://baike.baidu.com/item/Oracle) 旗下产品。

MySQL是最好的 [RDBMS](https://baike.baidu.com/item/RDBMS/1048260) (Relational Database Management System，关系数据库管理系统) 应用软件之一。

[开放源码](https://baike.baidu.com/item/开放源码/7176422)的数据库软件，体积小、速度快、总体拥有成本低

适用于中小型网站或大型网站，（集群）





###  1.5 Mysql安装

mysql5.7 64位下载地址:

https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.19-winx64.zip

电脑是64位的就下载使用64位版本的！

> 安装步骤

1、下载后得到zip压缩包.

2、解压到自己想要安装到的目录，本人解压到的是D:\Environment\mysql-5.7.19

3、添加环境变量：我的电脑->属性->高级->环境变量

```text
选择PATH,在其后面添加: 你的mysql 安装文件下面的bin文件夹

```

4、编辑 my.ini 文件 ,注意替换路径位置

```xml
[mysqld]
basedir=D:\Program Files\mysql-5.7\
datadir=D:\Program Files\mysql-5.7\data\
port=3306
skip-grant-tables
```

5、启动管理员模式下的CMD，并将路径切换至mysql下的bin目录，然后输入mysqld –install (安装mysql)

6、再输入 mysqld --initialize-insecure --user=mysql 初始化数据文件
7、然后再次启动mysql 然后用命令 mysql –u root –p 进入mysql管理界面（密码可为空）

8、进入界面后更改root密码

```sql
update mysql.user set authentication_string=password('123456') where user='root' 
and Host = 'localhost';

```

9、刷新权限

```xml
flush privileges;

```

10、修改 my.ini文件删除最后一句skip-grant-tables

11、重启mysql即可正常使用

```xml
net stop mysql
net start mysql

```

12、连接上测试出现以下结果就安装好了
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200511175311493.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Bhbl9oMTk5NQ==,size_16,color_FFFFFF,t_70)





