# 购物券表
CREATE TABLE t_voucher(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	deno DECIMAL(10, 2) UNSIGNED NOT NULL COMMENT "面值",
	`condition` DECIMAL(10, 2) UNSIGNED NOT NULL COMMENT "订单满多少钱可以使用",
	start_date DATE COMMENT "起始日期",
	end_data DATE COMMENT "截止日期",
	max_num INT COMMENT "优惠券发放最大数量"
) COMMENT = "购物券表";

# 客户关联购物券表
CREATE TABLE t_voucher_customer(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	voucher_id INT UNSIGNED NOT NULL COMMENT "购物券ID",
	costomer_id INT UNSIGNED NOT NULL COMMENT "客户ID"
) COMMENT = "客户关联购物券数据表";