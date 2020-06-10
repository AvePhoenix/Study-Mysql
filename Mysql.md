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





## 创建数据库

图形化界面

![image-20200603073717024](C:\Users\AVE\AppData\Roaming\Typora\typora-user-images\image-20200603073717024.png)

每一个sqlyog的执行操作就是对应的一个sql可以在历史记录上看到



## 连接数据库

命令行链接

连接数据库：mysql -u root -p123456

``` mysql
update mysql.user set authentication_string=password('812090') where user='root' and Host = 'localhost';
--修改用户密码
---------------------------------------------------

所有的语句都以；结尾
show databases;   #查看所有的数据库

use school;   #切换数据库

show tables;   #显示数据库中的所有表

describe student;   #显示表中的所有信息

 create database westos;  #创建数据库
 
 exit；    #推出连接
 
 --单行注释（有的地方是#）
 
 /*
 sql的多行注释
 */


```





**sql主演有四中语言**  CRUD(增删改查，基本业务)      CV（复制黏贴）     API（调用API）   

**DDL,数据库定义语言**

**DML,数据库操作语言**

**DQL,数据库查询语言**

**DCL，数据库控制语言**





# 操作数据库

操作数据库        操作数据表   操作数据库表的数据

Mysql数据库语句不区分大小写

## 2.1操作数据库

1. 创建数据库

   ```mysql  
   CREATE DATABASE [IF EXISTS] westos1;
   ```

2. 删除数据库

   ```mysql
   DROP DATABASE [IF EXISTS] westos1; 
   ```

3. 使用数据库

   ```mysql
   USE `school`  -- 若果表名或者特殊字符就需要``
   ```

4. 查看数据库

``` sql
SHOW DATABASES  -- 查看所有的数据库
```



## 数据库的列类型

##### 数值

1. 整数
   * tinyint:十分小的数据，一个字节
   * smallint：较小的数据，两个字节
   * int：标准的整数， 四个字节
   * mediumint：中等大小数据，三个字节
   * bigint：较大的数据，八个字节
2. 浮点数
   * float：浮点数，四个字节
   * double：浮点数，八个字节
   * decimal：字符串形式的浮点数，金融计算使用





#####　字符串

* char  字符串的固定大小为0-255
* **verchar：可变字符串 0-65535 常用的，对应String**
* tinytext：微型文本，2^8-1
* **text：文本串 ，2^16-1**



#####　时间日期

java.uit.Date

* date YYYY-MM-DD，日期
* time：HH:MM:SS ,时间
* **datetime：date+time**
* **timestamp：时间戳，1970.1.1到现在的毫秒数**
* year：年分



##### null

* 没有值，未知
* 不要使用NULL进行运算



## 数据库的字段属性

**unsigned**：

* 无符号整数
* 声明该列，不能为负数声明



**zerofill**：

* 0填充
* 不足的位数用0填充  int（3），5,-------->005



**自增：**

* 自动在上一条记录的基础上+1
* 通常设置为唯一的主键 index 是必须是int数据类型
* 可以自定义设计主键自增的起始值和步长





**非空：**

* 设置非空，不给他赋值就会报错
* NULL，如果不填写值，值默认就是空



**默认：**

* 设置默认的值
* sex，默认值为男



**每一个表都必须存在以下五个字段，表示数据存在的意义**

id	 主键

version	乐观锁

is_delete	伪删除

gmt_create	创建时间

gmt_update	修改时间





## 创建数据库表

``` mysql
-- 注意：用英文（），名称和字段用··括起来
-- 字符串使用‘’括起来，所有的语句有加，（最后除外）
CREATE TABLE IF NOT EXISTS `student`(
	`id` INT(4) NOT NULL AUTO_INCREMENT COMMENT '学号',
	-- AUTO_INCREMENT表示自增
	`name` VARCHAR(30) NOT NULL DEFAULT '匿名' COMMENT '姓名',
	-- DEFAULT 表示默认值
	`pwd` VARCHAR(20) NOT NULL DEFAULT '123456' COMMENT '密码',
	`sex` VARCHAR(2) NOT NULL DEFAULT '女' COMMENT '性别',
	`birthday` DATETIME DEFAULT NULL COMMENT '出生日期',
	`address` VARCHAR(100) DEFAULT NULL COMMENT '家庭住址',
	`email` VARCHAR(50) DEFAULT NULL COMMENT '邮箱',
	PRIMARY KEY(`id`)	
	 -- PRIMARY K`student`EY	主键，一般一个标只有一个
) ENGINE=INNODB DEFAULT CHARSET=utf8
```

##### 常用的命令

``` sql
SHOW CREATE DATABASE school -- 查看创建数据库的语句
SHOW CREATE TABLE student -- 查看student创建的语句
DESC student -- 显示标的具体结构
```



### 数据库引擎

``` sql

-- 关于数据库引擎
/*
innodb 默认使用
myisam 早些年使用
*/
```



**innodb**

* 事务支持：支持
* 数据行锁定：支持
* 外键索引：支持
* 全文索引：不支持（在5.6之后支持了，但是只支持全英文）
* 表空间的大小：较大，誉为两倍



**myisam**

* 事务支持：不支持

* 数据行锁定：不支持（表锁）

* 外键索引：不支持

* 全文索引：支持

* 表空间的大小：较小

  

**常规使用操作：**

1. **myisam**节约空间，速度较快
2. **innodb**安全性高，事务处理，多表用户操作



**在物理空间存储**

* 所有的数据库都存在date目录中，一个数据库就是一个文件夹
* 根本上还是文件存储



MYSQL引擎在物理文件上的区别

* innodb：在数据库表中只有一个*.frm文件，及上级目录到下级文件
* MYSAM对应文件
  * *.frm-表结构的定义文件
  * *.MYD 数据文件*（data）
  * *.MYI 索引文件（index）

在my.ini中可以配置字符集



## 删除和修改表

**修改**

``` sql
-- 修改表
ALTER TABLE teacher RENAME teach
-- 改变数据库名‘ ALTER TABLE 表名 RENAME 新表名 ’
ALTER TABLE teach ADD age INT(11)
-- 增加表的字段  ’ ALTER TABLE 表名 add 字段名 列属性 ‘
-- 修改标的字段1. 重命名；2.修改标的字段约束
ALTER TABLE teach MODIFY age VARCHAR(11) -- 修改约束，不能重命名
ALTER TABLE teach CHANGE age age1 INT (1) -- 重命名



```





**删除**

``` sql
-- 删除表的字段（不用delete，用drop）
ALTER TABLE teach DROP age1


-- 删除表
DROP TABLE teach 
```





## MYSQL的数据管理

###  外键

以学生的grade为例，

1. 定义一个外键：

2. 给这个外键添加约束（执行引用）

   ``` sql
   KEY `FK_GRADEID` (`GRADEID`)
   CONSTRAINT `FK_GRADEID` FOREIGN KEY (`GRADEID`) PEFERENCES `GRADE`(`GRADEID`)
   
   -- 写在表中
   
   ALTER TABLE teach
   add CONSTRAINT `FK_GRADEID` FOREIGN KEY (`GRADEID`) PEFERENCES `GRADE`(`GRADEID`)
   -- 使用修改的办法添加外键
   add CONSTRAINT 外键名称 FOREIGN KEY 字段名 PEFERENCES 引用的表（中的字段）
   ```

* 删除由外键的表的时候，需要先删除外键约束，才能删除

* 以上操作都是物理外键，在数据库级别的外键（不建议使用 ，避免数据库过多造成的困扰）

* 最佳实践：数据库就是单纯的表，只用来存储数据（字段+值）
* 我们想要使用多张表的数据，需要使用外键，用程序外键（程序实现）

### DML语言（重点）

数据库操作语言：

* insert
* update
* delete

### 添加insert

``` sql
-- 插入语句
-- insert into 表名（【字段名1，字段名2，字段名3】）value('值1')，('值2')，('值3')
INSERT INTO `grade`(`gradename`) VALUES('大四')

-- 由于主键自增，可以省略
INSERT INTO `grade` VALUE('大三')
/*
报错，如果不写表的字段，那么数据库会自动一一匹配（id，name）
==INSERT INTO `grade`（`id`，`gradename`） VALUE('大三',null)
所以一般写插入，一定要字段和数据一一对应
*/
-- 插入多个值
INSERT INTO `grade`(`gradename`) VALUES('大三'),('大二')
```

* 字段是可以省略的(可以不写字段)，但是值一定要一一对应，
* 插入多条数据，insert into 表名（【字段名1，字段名2，字段名3】）values('值1')，('值2')，('值3')

### 修改update

update 表名 set 字段1=新的值1，字段2=新的值2  where 条件

``` sql
-- 修改名字，指定了条件
UPDATE `grade` SET `gradename`='大一' WHERE gradeid=1;
-- 不指定条件的话，会改变所有的字段的值
UPDATE `grade` SET `gradename`='大一'
-- 多个数据修改
UPDATE `grade` SET `gradename`='大一',`gradeid`='4' WHERE gradeid=1;
-- 通过多个条件
UPDATE `grade` SET `gradename`='大二' WHERE gradeid>2 AND gradeid=3;
UPDATE `grade` SET `gradename`='大三' WHERE gradename='大一' OR gradeid>3;
```

条件：where子句 运算符 id=value,大小于，在某个区间

| 操作符          | 含义         | 范围 | 结果       |
| --------------- | ------------ | ---- | ---------- |
| =               | 等于         |      | true/false |
| <>或！=         | 不等于       |      |            |
| <               |              |      |            |
| >               |              |      |            |
| <=              |              |      |            |
| >=              |              |      |            |
| BETWEEN ..AND.. | 区间         |      | 【】       |
| AND             | &&,都成立    |      |            |
| or              | 其中一个成立 |      |            |

* 如果没有判断语句，就会修改所有字段的数据



### 删除

**delete**

delete from 表名 where 条件

``` sql
-- 删除数据（不建议使用，会全部删除）
DELETE FROM `grade` 
-- 删除指定数据
DELETE FROM `grade` WHERE gradeid=2;
```

**truncate**

``` sql
-- 完全清空一个数据库表，表的结构和索引约束不变
TRUNCATE `grade`
```

* 相同点，都可以删除数据，都能保持表结构
* 不同
  * **truncate**重新设置自增列，计数器回归0
  * **truncate**不会影响事务

用delete删除的问题，重启数据库，现象

* innodb 自增列会重1开始（存在内存中断电即失）
* myisan 继续从自增量开始（存在文件中，不会丢失）





## DQL查询数据（最重点）

​	data query language

* 所有的查询语句都用它  select
* 简单的查询和复杂的查询都能做
* 数据库中核心的语言



**指定查询字段**

``` sql
SELECT * FROM student
SELECT * FROM result
SELECT `studentno`,`studentname`FROM student
-- 可以给字段和表起别名
SELECT `studentno` AS 学号,`studentname` AS 姓名 FROM student AS s -- as 起别名
-- 函数 concat（a，b）拼接函数
SELECT CONCAT('姓名：',studentname) AS 新名字 FROM student
```

![image-20200609214836827](C:\Users\AVE\AppData\Roaming\Typora\typora-user-images\image-20200609214836827.png)

有的时候，列的名字你是那么清楚，我们就会去起别名



**去重复**distant

``` sql
-- 查询一下那些同学参加了考试
SELECT `studentno` FROM result  -- 发现重复数据
SELECT DISTINCT `studentno` FROM result   -- DISTINCT 查询结果所有的重复数据，只显示一条
SELECT VERSION() -- 查询系统版本号（函数）
SELECT 100*3-1 AS 计算结果 -- 用来计算 （表达式）
SELECT @@auto_increment_increment -- 查询自增的步长 （变量）

-- 学员考试成绩+1分查看
SELECT `studentno`,`studentresult`+1 AS '提分' FROM resul
```

数据库中的表达式：文本，列，NULL，函数，计算表达式，系统变量。。。





**where条件子句**

作用：检索符合条件的值

逻辑运算符

* and  &&  
* or   ||
* not  ！



**模糊查询**

本质是比较运算符

| 运算符      | 语法                 | 描述                        |
| ----------- | -------------------- | --------------------------- |
| is null     | a is null            | 如果操作符为null，结果为真  |
| is not null |                      |                             |
| between     | a  between b and c   | 若a在b和c之间，结果为真     |
| **like**    | a like b             | 如果a可以匹配到b，结果为真  |
| **in**      | a in （a1,a2,a3...） | a在其中的某个值中，结果为真 |

``` sql
-- 模糊查询
-- 查询姓赵的同学
SELECT `studentname`,`studentno` FROM `student`
WHERE studentname LIKE '赵%'
-- 查询姓赵的同学，明知后面只有一个字的
SELECT `studentname`,`studentno` FROM `student`
WHERE studentname LIKE '赵_'
/*
	模糊查询like中
	%代表任意字符
	_代表一个字符（课重复使用）
	_ _ 两个字符
*/

-- 查询名字中有伟字的同学 %伟%
SELECT `studentname`,`studentno` FROM `student`
WHERE studentname LIKE '%伟%'

-- in
-- 查询 1001 1002 1003号学生
SELECT `studentname`,`studentno` FROM `student`
WHERE studentno IN (1000,1002,1003)
-- 查询在北京的学生
SELECT `studentname`,`studentno` FROM `student`
WHERE `address` IN ('北京朝阳')
/*
	like才能用% 和_ in中必须用精确值

*/

```











### 插入百万条数据

``` sql
-- 插入100万数据.
DELIMITER $$
-- 写函数之前必须要写，标志
CREATE FUNCTION mock_data ()
RETURNS INT
BEGIN
	DECLARE num INT DEFAULT 1000000;
	DECLARE i INT DEFAULT 0;
	WHILE i<num DO
		INSERT INTO `student`(`studentname`,`eamil`,`phone`,`gender`)VALUES(CONCAT('用户',i),'19224305@qq.com','123456789',FLOOR(RAND()*2));
		SET i=i+1;
	END WHILE;
	RETURN i;
END;

SELECT mock_data() -- 执行此函数 生成一百万条数据

```





### 联表查询（join）

```sql
-- 联表查询
-- 参加考试的同学的（学号姓名，科目编号，分数）
SELECT * FROM student
SELECT * FROM result

/*
	第一：分析需求（查询的内容来自那张表，超过一张就要连接）
	确定使用那种连接   7种
	确定交叉点（那些数据是相同的）
	判断的条件，学生表中的studentno=studentno
	
```



**left join**

``` sql

SELECT s.studentno,studentname,subjectno,studentresult 
FROM student s 
LEFT JOIN result  r
-- WHERE s.studentno=r.studentno
ON s.studentno=r.studentno

```



**right join**

``` sql


-- right join
SELECT s.studentno,studentname,subjectno,studentresult 
FROM student s 
RIGHT JOIN result  r
-- WHERE s.studentno=r.studentno
ON s.studentno=r.studentno
/*
在join中ON s.studentno=r.studentno等价于WHERE s.studentno=r.studentno
*/
```



**inner join**

``` sql

*/
-- inner join
SELECT s.studentno,studentname,subjectno,studentresult -- 两个表中都有studentno，所以需要标明其中之一
FROM student AS s 
INNER JOIN result AS r
WHERE s.studentno=r.studentno

```

| 操作       | 描述                                             |
| ---------- | ------------------------------------------------ |
| inner join | 表中至少有一个匹配，就返回                       |
| left join  | 即使右表中没有匹配，也会返回左边的表中的所有结果 |
| right join | 即使左表中没有匹配，也会返回右边的表中的所有结果 |

``` sql
SELECT s.studentno,studentname,subjectno,studentresult 
FROM student s 
LEFT JOIN result  r
-- WHERE s.studentno=r.studentno
ON s.studentno=r.studentno
WHERE studentresult IS NULL


join（连接的表） on（判断条件）   -- 连接查询
where    -- 等值查询
```

``` sql

-- 三表查询
SELECT s.studentno,studentname,subjectname,studentresult 
FROM student s 
RIGHT JOIN result r
ON s.studentno=r.studentno
INNER JOIN `subject` sub
ON r.subjectno=sub.subjectno
```



### 自连接

自己的表和自己的表连接，核心：**一张表拆为两张一样的表**

``` sql
-- 查询父子信息
SELECT a.`categoryname` AS '父栏目',b.`categoryname` AS '子栏目'
FROM category AS a,category AS b
WHERE a.`categoryid`=b.`pid`
/*
核心是将一张表看成两张一样的表
将其裁成两张表
*/

```



### 分页和排序

分页（limit）和排序（oder by）

``` sql

-- oder by:排序
-- 升序：asc   降序：desc
SELECT s.studentno,studentname,subjectname,studentresult 
FROM student s 
RIGHT JOIN result r
ON s.studentno=r.studentno
INNER JOIN `subject` sub
ON r.subjectno=sub.subjectno
ORDER BY `studentresult` DESC
-- ORDER BY  通过那个字段排序
```

``` sql
-- 分页
SELECT s.studentno,studentname,subjectname,studentresult 
FROM student s 
RIGHT JOIN result r
ON s.studentno=r.studentno
INNER JOIN `subject` sub
ON r.subjectno=sub.subjectno
ORDER BY `studentresult` DESC
LIMIT 0,5
-- limit 起始值，每页的显示数量


```



### 子查询和嵌套查询

where （查询出来的值）

在where中嵌套一个子查询语句

```sql
-- 子查询
SELECT `studentno`,`subjectno`,`studentresult`
FROM `result`
WHERE `subjectno`=(
	SELECT subjectno FROM `subject`
	WHERE subjectname='高等数学-4'
		)

```

```sql
SELECT studentno,`studentname` FROM student WHERE studentno IN (
	SELECT studentno FROM result WHERE studentresult>80 AND subjectno=(
		SELECT subjectno FROM `subject` WHERE `subjectname`='高等数学-4'
	)
)

SELECT s.studentno,`studentname`,`studentresult`
FROM student s
INNER JOIN `result` r
ON s.`studentno`=r.`studentno`
WHERE subjectno=(
		SELECT subjectno FROM `subject` WHERE `subjectname`='高等数学-4'
	)
ORDER BY studentresult DESC
LIMIT 0,10

```

  



### mysql函数

**常用函数**

``` sql
SELECT ABS(-8) -- 绝对值
SELECT CEILING(9.4) -- 向上取整
SELECT FLOOR(9.4) -- 向下取整
SELECT RAND() -- 返回一个0~1的随机数
SELECT SIGN(10) -- 判断一个数的符号 负数返回-1   整数返回1

-- 字符串的函数
SELECT CHAR_LENGTH('是啊时刻九阿哥书法课上发生的') -- 字符串长度
SELECT CONCAT('我','爱') -- 拼接字符串
SELECT INSERT('可是骄傲和方式的快乐就好发啦时间',1,2,'按设计得噶介绍个') -- 查询，替换，从某个位置开始替换某个长度
SELECT LOWER('FVYGTVJH') -- 转小写
SELECT UPPER('sadfasd') -- 转大写
SELECT INSTR('salhd','h') -- 返回第一次出现的字符串
SELECT REPLACE('坚持就能成功','坚持','努力') -- 替换指定字符串
SELECT SUBSTRING('坚持就能成功',2,4) -- 返回指定字符串(源字符串，位置，长度)
SELECT REVERSE('坚持就能成功') -- 反转

-- 查询姓 张 的同学，将 张 换成 章
SELECT REPLACE(studentname,'张','章') FROM student 
WHERE studentname LIKE '张%'


-- 时间和日期函数
SELECT CURRENT_DATE() -- 获取当前日期
SELECT CURDATE() -- 获取当前日期
SELECT NOW() -- 获取当前时间
SELECT LOCALTIME() -- 获取本地时间
SELECT SYSDATE() -- 获取系统时间
SELECT YEAR(NOW()) -- 获取时间的年份
SELECT MONTH(NOW()) -- 获取时间的月份
SELECT DAY(NOW()) -- 获取时间的日份
SELECT HOUR(NOW()) -- 获取时间的时份
SELECT MINUTE(NOW()) -- 获取时间的分份
SELECT SECOND(NOW()) -- 获取时间的秒份


-- 系统
SELECT SYSTEM_USER() -- 获取当前登入

SELECT USER()
SELECT VERSION() -- 系统版本
```



**聚合函数**,**分组于过滤**

| 函数名称  | 描述   |
| --------- | ------ |
| count（） | 计数   |
| sum（）   | 求和   |
| avg（）   | 平均值 |
| max（）   | 最大值 |
| min（）   | 最小值 |
|           |        |

``` sql
-- 聚合函数
SELECT COUNT(studentname) FROM student -- count(字段)，会忽略所有的null值
SELECT COUNT(*) FROM student -- count(*)，不会忽略所有的null值，本质 计算行数
SELECT COUNT(1) FROM student -- count(1)，不会忽略所有的null值
/*
	三个都可以以统计，
*/
-- 查询不同课程的平均，最低，最高，总和分
-- 核心：根据不同的课程进行分组
SELECT `subjectname`,AVG(studentresult) ,MAX(studentresult),MIN(studentresult),SUM(studentresult)
FROM result r
INNER JOIN `subject` sub
ON r.`subjectno`=sub.`subjectno`
-- where AVG(studentresult)>80
GROUP BY r.`subjectno`
HAVING AVG(studentresult)>80 -- 分组后过滤
-- GROUP BY 通过什么字段分组


```

### 数据库的MD5加密

不可逆，增强算法复杂度

``` sql
-- 测试MD5  加密
CREATE TABLE `testmd5`(
	`id` INT(4) NOT NULL,
	`name` VARCHAR(20) NOT NULL,
	`pwd` VARCHAR(50) NOT NULL,
	PRIMARY KEY(`id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8


INSERT INTO `testmd5` 
VALUES(1,'zhangqinglin','1234sa56'),(2,'zhang','12343256'),(3,'qing','1234456'),(4,'lin','1233d456')
-- 明文密码
-- 加密
UPDATE testmd5 SET pwd=MD5(pwd) WHERE id=1

-- 插入的时候加密
INSERT INTO `testmd5` 
VALUES(5,'小明',MD5('1234sa56'))

-- 如何校验：将用户传来的值，进行MD5加密，然后对比加密后的值
SELECT * FROM `testmd5` WHERE `name`='小明' AND `pwd`=MD5('1234sa56')

```



### 事务

要么都成功，要么都失败

核心，将一组sql放在一个批次去执行

**原则：ACID**

* **原子性（Atomicity）**
  原子性是指事务是一个不可分割的工作单位，事务中的操作要么都发生，要么都不发生。

* **一致性（Consistency）**
  事务前后数据的完整性必须保持一致。

* **隔离性（Isolation）**
  事务的隔离性是多个用户并发访问数据库时，数据库为每一个用户开启的事务，不能被其他事务的操作数据所干扰，多个并发事务之间要相互隔离。

  

* **持久性（Durability）**
  持久性是指一个事务一旦被提交，它对数据库中数据的改变就是永久性的，接下来即使数据库发生故障也不应该对其有任何影响
  事物没有提交就恢复到原状，提交了就不变

  

  （隔离失败）

**脏读**:指一个事务读取了另外一个事务未提交的数据

**幻读**:指在一个事务内读取到了别的事务插入的数据，导致前后读取不一致。

``` sql
-- 事务
-- mysql 是默认开启事务自动提交的
SET autocommit=0 /* 关闭*/
SET autocommit=1 /* 开启（默认的）*/
-- 手动处理事务
SET autocommit=0 /* 关闭*/
-- 事物开启
START TRANSACTION -- 标记事物开始，在这之后的sql都在同一个事务内
-- 提交：持久化
COMMIT
-- 回滚：恢复到原来的样子
ROLLBACK
-- 事务结束
SET autocommit=1 /* 开启（默认的）*/

SAVEPOINT 保存点名称 -- 设置一个事务的保存点
ROLLBACK TO SAVEPOINT 保存点名 -- 回滚到保存点
RELEASE SAVEPOINT -- 撤销保存点



```

``` sql
-- 模拟转账  一组事务
SET autocommit=0 ;-- 关闭自动提交
START TRANSACTION -- 开启一个事务
UPDATE account SET money=money-500 WHERE `name` ='A' -- A转500
UPDATE account SET money=money+500 WHERE `name` ='B' -- B收500

COMMIT; -- 提交事务，一旦提交就持久化
ROLLBACK; -- 回滚

SET autocommit=1; -- 回复默认值


```

