CREATE TABLE t_sku(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	spu_id INT UNSIGNED NOT NULL COMMENT "产品ID",
	title VARCHAR(200) NOT NULL COMMENT "商品标题",
	images JSON COMMENT "商品图片",
	price DECIMAL(10,2) UNSIGNED NOT NULL COMMENT "价格",
	param JSON NOT NULL COMMENT "参数",
	saleable BOOLEAN NOT NULL COMMENT "是否上架",
	valid BOOLEAN NOT NULL COMMENT "是否有效",
	create_time TIMESTAMP NOT NULL DEFAULT NOW() COMMENT "添加时间",
	last_update_time TIMESTAMP NOT NULL DEFAULT NOW() COMMENT "最后修改时间",
	INDEX idx_spu_id(spu_id),
	INDEX idx_saleable(saleable),
	INDEX idx_valid(valid)
) COMMENT "商品表";