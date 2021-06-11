# 供货商表
CREATE TABLE t_supplier(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	`code` VARCHAR(200) NOT NULL COMMENT "供货商编号",
	`name` VARCHAR(200) NOT NULL COMMENT "供货商名称",
	type TINYINT UNSIGNED NOT NULL COMMENT "类型：1厂家，2代理商，3个人",
	link_man VARCHAR(20) NOT NULL COMMENT "联系人",
	tel VARCHAR(20) NOT NULL COMMENT "联系电话",
	address VARCHAR(200) NOT NULL COMMENT "联系地址",
	bank_name VARCHAR(200) COMMENT "开户银行名称",
	bank_account VARCHAR(200) COMMENT "银行帐号",
	`status` TINYINT UNSIGNED NOT NULL COMMENT "状态：·可用，2不可用",
	INDEX idx_code(`code`),
	INDEX idx_type(type),
	INDEX idx_status(`status`),
	UNIQUE unq_code(`code`)
) COMMENT = "供货商表";


# 供货商关联商品表
CREATE TABLE t_supplier_sku(
	supplier_id INT UNSIGNED AUTO_INCREMENT COMMENT "供货商ID",
	sku_id INT UNSIGNED NOT NULL COMMENT "商品ID",
	PRIMARY KEY(supplier_id, sku_id)
) COMMENT = "供货商关联商品表";