# 普通查询方法
SELECT id,val FROM t_test LIMIT 100,10;
SELECT id,val FROM t_test LIMIT 10000,10;
SELECT id,val FROM t_test LIMIT 1000000,10;
SELECT id,val FROM t_test LIMIT 5000000,10;
SELECT id,val FROM t_test LIMIT 9000000,10;


# 优化方案
# 利用主键索引来加速分页查询（速度快了上百倍）
SELECT id,val FROM t_test WHERE id>=9000000 LIMIT 10;
SELECT id,val FROM t_test WHERE id>=9000000 AND id<=9000000+10;

# 利用主键索引加速，再做表连接查询
SELECT t.id, t.val
FROM t_test t JOIN
(SELECT id FROM t_test LIMIT 90000000,10) tmp
ON t.id = tmp.id;