# 零售店表
CREATE TABLE t_shop(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	city_id INT UNSIGNED NOT NULL COMMENT "城市ID",
	address VARCHAR(200) NOT NULL COMMENT "地址",
	tel VARCHAR(20) NOT NULL COMMENT "电话",
	INDEX idx_city_id(city_id)
) COMMENT = "零售店表";


# 零售商品库存表
CREATE TABLE t_shop_sku(
	shop_id INT UNSIGNED COMMENT "主键",
	sku_id INT UNSIGNED COMMENT "商品ID",
	num INT UNSIGNED NOT NULL COMMENT "库存数量",
	unit VARCHAR(20) NOT NULL COMMENT "库存单位",
	PRIMARY KEY(shop_id, sku_id)
) COMMENT = "零售店商品库存表";