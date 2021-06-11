CREATE TABLE t_spec_param(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	spg_id INT UNSIGNED NOT NULL COMMENT "品类编号",
	spp_id INT UNSIGNED NOT NULL COMMENT "参数编号",
	`name` VARCHAR(200) NOT NULL COMMENT "参数名称",
	`numeric` BOOLEAN NOT NULL COMMENT "是否为数字参数",
	unit VARCHAR(200) COMMENT "单位（量词）",
	generic BOOLEAN NOT NULL COMMENT "是否为通用参数",
	searching BOOLEAN NOT NULL COMMENT "是否用于通用搜索",
	segements VARCHAR(500) COMMENT "参数值",
	INDEX idx_spg_id(spg_id),
	INDEX idx_spp_id(spp_id)
) COMMENT = "参数表";
