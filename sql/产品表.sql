CREATE TABLE t_spu(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	title VARCHAR(200) NOT NULL COMMENT "标题",
	sub_title VARCHAR(200) COMMENT "副标题",
	category_id INT UNSIGNED NOT NULL COMMENT "分类ID",
	brand_id INT UNSIGNED COMMENT "品牌ID",
	spg_id INT UNSIGNED NOT NULL COMMENT "品类ID",
	saleable BOOLEAN NOT NULL COMMENT "是否上架",
	valid BOOLEAN NOT NULL COMMENT "是否有效",
	create_time TIMESTAMP NOT NULL DEFAULT NOW() COMMENT "添加时间",
	last_update_time TIMESTAMP NOT NULL DEFAULT NOW() COMMENT "最后修改时间",
	INDEX idx_brand_id(brand_id),
	INDEX idx_category_id(category_id),
	INDEX idx_spg_id(spg_id),
	INDEX idx_saleable(saleable),
	INDEX idx_valid(valid)
) COMMENT = "产品表";