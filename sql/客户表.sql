# 会员等级表
CREATE TABLE t_level(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	`level` VARCHAR(200) NOT NULL COMMENT "等级",
	discount DECIMAL(10, 2) UNSIGNED NOT NULL COMMENT "折扣"
) COMMENT = "会员等级表";


# 客户表
CREATE TABLE t_costomer(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	username VARCHAR(200) NOT NULL COMMENT "用户名",
	`password` VARCHAR(2000) NOT NULL COMMENT "密码",
	wechat VARCHAR(200) COMMENT "微信号",
	tel CHAR(11) COMMENT "手机号",
	level_id INT UNSIGNED COMMENT "会员等级",
	create_time TIMESTAMP NOT NULL DEFAULT NOW() COMMENT "添加时间",
	last_update_time TIMESTAMP NOT NULL DEFAULT NOW() COMMENT "最后修改时间",
	INDEX idx_username(username),
	UNIQUE unq_username(username)
) COMMENT = "客户表";


# 客户收获地址表
CREATE TABLE t_costomer_address(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	customer_id INT UNSIGNED NOT NULL COMMENT "客户ID",
	`name` VARCHAR(200) NOT NULL COMMENT "收货人姓名",
	tel CHAR(11) NOT NULL COMMENT "收货人电话",
	address VARCHAR(200) NOT NULL COMMENT "收获地址",
	prime BOOLEAN NOT NULL COMMENT "是否为缺省（默认）收获地址",
	INDEX idx_customer_id(customer_id)
) COMMENT = "收获地址表";