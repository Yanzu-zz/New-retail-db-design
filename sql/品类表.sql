CREATE TABLE t_spec_group(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	spg_id INT UNSIGNED NOT NULL COMMENT "品类编号",
	`name` VARCHAR(200) NOT NULL COMMENT "品类名称",
	UNIQUE INDEX unq_spg_id(spg_id),
	UNIQUE INDEX unq_name(`name`),
	INDEX idx_spg_id(spg_id)
) COMMENT="品类表";