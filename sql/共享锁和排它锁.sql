# 共享锁
BEGIN;
SELECT * FROM t_user WHERE id <=10 LOCK IN SHARE MODE;
COMMIT; # 释放共享锁

# 实验一下是否能改变加了共享锁的记录
# 由于没有释放锁，故 sql 就死循环在这等待了
UPDATE t_user SET `status`="1" WHERE id<=100;
ROLLBACK; # 回滚

# 虽然不能修改，但是可以查询加锁的数据
SELECT * from t_user WHERE id<=100;



# 排它锁（mysql 添加修改更新时自动加上）
# 开启事物的同时不结束它，则排它锁会一直不释放
BEGIN; 
UPDATE t_user SET `status`="1" WHERE id<=100;

# 此时增删改是无法起作用的，sql 空转等待锁的释放
DELETE FROM t_user WHERE id<=10;
# 此时再加锁也不行
SELECT * FROM t_user WHERE id<=10 for UPDATE;

COMMIT; # 先不释放