CREATE TABLE t_brand(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	`name` VARCHAR(200) NOT NULL COMMENT "名称",
	image VARCHAR(500) COMMENT "图片网址",
	letter CHAR(1) NOT NULL COMMENT "品牌首字母",
	UNIQUE unq_name(`name`),
	INDEX idx_letter(letter)
) COMMENT = "品牌表";