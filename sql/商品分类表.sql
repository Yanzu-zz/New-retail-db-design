CREATE TABLE t_category(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	`name` VARCHAR(200) NOT NULL COMMENT "分类名称",
	parent_id INT UNSIGNED COMMENT "上级分类ID",
	if_parent BOOLEAN NOT NULL COMMENT "是否含有下级分类",
	sort INT UNSIGNED NOT NULL COMMENT "排名指数",
	INDEX idx_parent_id(parent_id),
	INDEX idx_sort(sort)
) COMMENT = "商品分类表";