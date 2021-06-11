CREATE TABLE t_province(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	province VARCHAR(200) NOT NULL COMMENT "省份",
	UNIQUE unq_province(province)
) COMMENT = "省份表";