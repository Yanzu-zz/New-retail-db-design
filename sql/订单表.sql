# 订单表
CREATE TABLE t_order(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	`code` VARCHAR(200) NOT NULL COMMENT "流水号",
	type TINYINT UNSIGNED NOT NULL COMMENT "订单类型：1实体销售，2网络销售",
	shop_id INT UNSIGNED COMMENT "零售店ID",
	customer_id INT UNSIGNED COMMENT "会员ID",
	amount DECIMAL(10, 2) UNSIGNED NOT NULL COMMENT "总金额",
	payment_type TINYINT UNSIGNED NOT NULL COMMENT "支付方式：1借记卡，2信用卡，3微信，4支付宝，5微信",
	`status` TINYINT UNSIGNED NOT NULL COMMENT "状态：1未付款，2已付款，3已发货，4已签收",
	postage DECIMAL(10, 2) UNSIGNED COMMENT "邮费",
	weight INT UNSIGNED COMMENT "重量（克）",
	voucher_id INT UNSIGNED COMMENT "购物券ID",
	create_time TIMESTAMP NOT NULL DEFAULT NOW() COMMENT "创建时间",
	INDEX idx_code(`code`),
	INDEX idx_customer_id(customer_id),
	INDEX idx_status(`status`),
	INDEX idx_create_time(create_time),
	INDEX idx_type(type),
	INDEX idx_shop_id(shop_id),
	UNIQUE unq_code(`code`)
) COMMENT = "订单表";


# 订单详情表
CREATE TABLE t_order_detail(
	order_id INT UNSIGNED NOT NULL COMMENT "订单ID",
	sku_id INT UNSIGNED NOT NULL COMMENT "商品ID",
	price DECIMAL(10, 2) UNSIGNED NOT NULL COMMENT "原价格",
	actual_price DECIMAL(10, 2) UNSIGNED NOT NULL COMMENT "实际购买价格",
	num INT UNSIGNED NOT  NULL COMMENT "购买数量",
	PRIMARY KEY(order_id, sku_id)
) COMMENT = "订单详情表";