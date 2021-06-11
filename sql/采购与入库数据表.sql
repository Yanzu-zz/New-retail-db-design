# 采购表
CREATE TABLE t_purchase(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	sku_id INT UNSIGNED NOT NULL COMMENT "商品ID",
	num INT UNSIGNED NOT NULL COMMENT "数量",
	warehouse_id INT UNSIGNED NOT NULL COMMENT "仓库ID",
	in_price DECIMAL(10, 2) UNSIGNED NOT NULL COMMENT "采购价格",
	out_price DECIMAL(10, 2) UNSIGNED COMMENT "建议零售价",
	buyer_id INT UNSIGNED NOT NULL COMMENT "采购员ID",
	`status` TINYINT UNSIGNED NOT NULL COMMENT "状态：·未完成，2已完成",
	create_time TIMESTAMP NOT NULL DEFAULT NOW() COMMENT "添加时间",
	INDEX idx_sku_id(sku_id),
	INDEX idx_warehouse_id(warehouse_id),
	INDEX idx_buyer_id(buyer_id),
	INDEX idx_status(`status`),
	INDEX idx_create_time(create_time)
) COMMENT = "采购表";


# 入库信息表
CREATE TABLE t_productin(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	storekeeper_id INT UNSIGNED NOT NULL COMMENT "保管员ID",
	amount DECIMAL(15, 2) UNSIGNED NOT NULL COMMENT "总金额",
	supplier_id INT UNSIGNED NOT NULL COMMENT "供应商ID",
	payment DECIMAL(15, 2) UNSIGNED NOT NULL COMMENT "实付金额",
	payment_type TINYINT UNSIGNED NOT NULL COMMENT "支付方式",
	invoice BOOLEAN NOT NULL COMMENT "是否开票",
	remark VARCHAR(200) COMMENT "备注",
	create_time TIMESTAMP NOT NULL DEFAULT NOW() COMMENT "添加时间",
	INDEX idx_storekeeper_id(storekeeper_id),
	INDEX idx_supplier_id(supplier_id),
	INDEX idx_payment_type(payment_type),
	INDEX idx_create_time(create_time)
) COMMENT = "入库信息表";


# 采购与入库关联表
CREATE TABLE t_productin_purchase(
	productin_id INT UNSIGNED NOT NULL COMMENT "入库ID",
	purchase_id INT UNSIGNED NOT NULL COMMENT "采购ID",
	PRIMARY KEY(productin_id, purchase_id)
) COMMENT = "入库商品表";