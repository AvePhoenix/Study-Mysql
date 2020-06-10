SELECT * FROM student
SELECT * FROM result
SELECT `studentno`,`studentname`FROM student
-- 可以给字段和表起别名
SELECT `studentno` AS 学号,`studentname` AS 姓名 FROM student AS s -- as 起别名
-- 函数 concat（a，b）拼接函数
SELECT CONCAT('姓名：',studentname) AS 新名字 FROM student
-- 查询一下那些同学参加了考试，成绩
SELECT * FROM result -- 查询所有成绩

-- 查询一下那些同学参加了考试
SELECT `studentno` FROM result  -- 发现重复数据
SELECT DISTINCT `studentno` FROM result   -- DISTINCT 查询结果所有的重复数据，只显示一条
SELECT VERSION() -- 查询系统版本号（函数）
SELECT 100*3-1 AS 计算结果 -- 用来计算 （表达式）
SELECT @@auto_increment_increment -- 查询自增的步长 （变量）

-- 学员考试成绩+1分查看
SELECT `studentno`,`studentresult`+1 AS '提分' FROM result 


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

-- 插入100万数据.
DELIMITER $$
-- 写函数之前必须要写，标志
CREATE FUNCTION mock_data ()
RETURNS INT
BEGIN
	DECLARE num INT DEFAULT 1000000;
	DECLARE i INT DEFAULT 0;
	WHILE i<num DO
		INSERT INTO `student`(`name`,`eamil`,`phone`,`gender`)VALUES(CONCAT('用户',i),'19224305@qq.com','123456789',FLOOR(RAND()*2));
		SET i=i+1;
	END WHILE;
	RETURN i;
END;

SELECT mock_data() -- 执行此函数 生成一百万条数据


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


-- 联表查询
-- 参加考试的同学的（学号姓名，科目编号，分数）
SELECT * FROM student
SELECT * FROM result

/*
	第一：分析需求（查询的内容来自那张表，超过一张就要连接）
	确定使用那种连接   7种
	确定交叉点（那些数据是相同的）
	判断的条件，学生表中的studentno=studentno
	
*/
-- inner join
SELECT s.studentno,studentname,subjectno,studentresult -- 两个表中都有studentno，所以需要标明其中之一
FROM student AS s 
INNER JOIN result AS r
WHERE s.studentno=r.studentno

-- right join
SELECT s.studentno,studentname,subjectno,studentresult 
FROM student s 
RIGHT JOIN result  r
-- WHERE s.studentno=r.studentno
ON s.studentno=r.studentno
/*
在join中ON s.studentno=r.studentno等价于WHERE s.studentno=r.studentno
*/
SELECT s.studentno,studentname,subjectno,studentresult 
FROM student s 
LEFT JOIN result  r
-- WHERE s.studentno=r.studentno
ON s.studentno=r.studentno

-- 缺考的同学
SELECT s.studentno,studentname,subjectno,studentresult 
FROM student s 
LEFT JOIN result  r
-- WHERE s.studentno=r.studentno
ON s.studentno=r.studentno
WHERE studentresult IS NULL


-- 三表查询
SELECT s.studentno,studentname,subjectname,studentresult 
FROM student s 
RIGHT JOIN result r
ON s.studentno=r.studentno
INNER JOIN `subject` sub
ON r.subjectno=sub.subjectno



CREATE TABLE `category` (
	`categoryid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主题id',
	`pid` INT(10) NOT NULL COMMENT '父id',
	`categoryname` VARCHAR(50) NOT NULL COMMENT '主题名字',
	PRIMARY KEY(`categoryid`)
)ENGINE=INNODB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8

INSERT INTO `category` (`categoryid` ,`pid`,`categoryname`)
VALUES('2','1','信息技术'),
('3','1','软件开发'),
('4','3','数据库'),
('5','1','美术设计'),
('6','3','web开发'),
('7','5','ps技术'),
('8','2','办公信息');


-- 查询父子信息
SELECT a.`categoryname` AS '父栏目',b.`categoryname` AS '子栏目'
FROM category AS a,category AS b
WHERE a.`categoryid`=b.`pid`
/*
核心是将一张表看成两张一样的表
将其裁成两张表
*/


-- 分页（limit）和排序（oder by）
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


-- 子查询
SELECT `studentno`,`subjectno`,`studentresult`
FROM `result`
WHERE `subjectno`=(
	SELECT subjectno FROM `subject`
	WHERE subjectname='高等数学-4'
		)


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



CREATE DATABASE shop CHARACTER SET utf8 COLLATE utf8_general_ci
USE shop


CREATE TABLE `account`(
	`id` INT(3) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(30) NOT NULL,
	`money` DECIMAL(9,2) NOT NULL,
	PRIMARY KEY(`id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8



INSERT INTO account(`name`,`money`)
VALUES('A',2000.00),('B',10000.00)


-- 模拟转账  一组事务
SET autocommit=0 ;-- 关闭自动提交
START TRANSACTION -- 开启一个事务
UPDATE account SET money=money-500 WHERE `name` ='A' -- A转500
UPDATE account SET money=money+500 WHERE `name` ='B' -- B收500

COMMIT; -- 提交事务，一旦提交就持久化
ROLLBACK; -- 回滚

SET autocommit=1; -- 回复默认值























































