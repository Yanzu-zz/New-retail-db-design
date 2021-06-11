# 仓库表
CREATE TABLE t_warehouse(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	city_id INT UNSIGNED NOT NULL COMMENT "城市ID",
	address VARCHAR(200) NOT NULL COMMENT "地址",
	tel VARCHAR(20) NOT NULL COMMENT "电话",
	INDEX idx_city_id(city_id)
) COMMENT = "仓库表";

# 仓库商品库存表
CREATE TABLE t_warehouse_sku(
	warehouse_id INT UNSIGNED AUTO_INCREMENT COMMENT "主键",
	sku_id INT UNSIGNED COMMENT "商品ID",
	num INT UNSIGNED NOT NULL COMMENT "库存数量",
	unit VARCHAR(20) NOT NULL COMMENT "库存单位",
	PRIMARY KEY(warehouse_id, sku_id)
) COMMENT = "仓库商品库存表";