# 评价表
CREATE TABLE t_rating(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "评价ID",
	order_id INT UNSIGNED NOT NULL COMMENT "订单ID",
	sku_id INT UNSIGNED NOT NULL COMMENT "商品ID",
	img JSON COMMENT "",
	rating TINYINT UNSIGNED NOT NULL COMMENT "评分",
	`comment` VARCHAR(200) DEFAULT "该用户很懒，什么都没留下" COMMENT "评论",
	create_time TIMESTAMP NOT NULL DEFAULT NOW() COMMENT "添加时间",
	INDEX idx_order_id(order_id),
	INDEX idx_sku_id(sku_id),
	INDEX idx_create_time(create_time)
) COMMENT = "评价表";