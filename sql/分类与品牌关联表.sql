CREATE TABLE t_category_brand(
	category_id INT UNSIGNED COMMENT "分类ID",
	brand_id INT UNSIGNED COMMENT "品牌ID",
	PRIMARY KEY(category_id, brand_id)
) COMMENT = "分类与品牌关联表";