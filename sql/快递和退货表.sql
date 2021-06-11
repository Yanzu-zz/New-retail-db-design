# 快递表
CREATE TABLE t_delivery(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	order_id INT UNSIGNED NOT NULL COMMENT "订单ID",
	sku JSON NOT NULL COMMENT "商品",
	qa_id INT UNSIGNED NOT NULL COMMENT "质检员ID",
	de_id INT UNSIGNED NOT NULL COMMENT "发货员ID",
	postid INT UNSIGNED NOT NULL COMMENT "快递单号",
	price DECIMAL UNSIGNED NOT NULL COMMENT "快递费",
	ecp TINYINT UNSIGNED NOT NULL COMMENT "快递公司编号",
	address_id INT UNSIGNED NOT NULL COMMENT "收获地址ID",
	warehouse_id INT UNSIGNED NOT NULL COMMENT "仓库ID",
	create_time TIMESTAMP NOT NULL DEFAULT NOW() COMMENT "创建时间",
	INDEX idx_order_id(order_id),
	INDEX idx_qa_id(qa_id),
	INDEX idx_de_id(de_id),
	INDEX idx_postid(postid),
	INDEX idx_warehouse_id(warehouse_id),
	INDEX idx_address_id(address_id),
	INDEX idx_ecp(ecp)
) COMMENT = "快递表";


# 退货表
CREATE TABLE t_backstock(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	order_id INT UNSIGNED NOT NULL COMMENT "订单ID",
	sku JSON NOT NULL COMMENT "退货商品",
	reason VARCHAR(200) NOT NULL COMMENT "退货原因",
	qa_id INT UNSIGNED NOT NULL COMMENT "质检员ID",
	payment DECIMAL(10, 2) UNSIGNED NOT NULL COMMENT "退款金额",
	payment_type TINYINT UNSIGNED NOT NULL COMMENT "退款方式：·借记卡，2信用卡，3微信，4支付宝，5现金",
	`status` TINYINT UNSIGNED NOT NULL COMMENT "状态：1退货成功，2无法退货",
	create_time TIMESTAMP NOT NULL DEFAULT NOW() COMMENT "添加时间",
	INDEX idx_order_id(order_id),
	INDEX idx_qa_id(qa_id),
	INDEX idx_status(`status`)
) COMMENT = "退货表";