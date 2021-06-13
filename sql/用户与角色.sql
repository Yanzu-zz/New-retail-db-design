# 角色表
CREATE TABLE t_role(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	role VARCHAR(20) NOT NULL COMMENT "角色名称",
	UNIQUE unq_role(role)
) COMMENT = "角色表";

# 创建角色表的历史表
CREATE TABLE t_user_history LIKE t_user;


# 用户表
CREATE TABLE t_user(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	username VARCHAR(200) NOT NULL COMMENT "用户名",
	`password` VARCHAR(2000) NOT NULL COMMENT "密码（AES加密）",
	emp_id INT UNSIGNED NOT NULL COMMENT "员工ID",
	role_id INT UNSIGNED NOT NULL COMMENT "角色ID",
	`status` TINYINT UNSIGNED NOT NULL COMMENT "状态：1可用，2禁用",
	create_time TIMESTAMP NOT NULL DEFAULT NOW() COMMENT "添加时间",
	last_update_time TIMESTAMP NOT NULL DEFAULT NOW() COMMENT "最后修改时间",
	UNIQUE unq_username(username),
	INDEX idx_username(username),
	INDEX idx_emp_id(emp_id),
	INDEX idx_role_id(role_id),
	INDEX idx_status(`status`)
) COMMENT = "用户表";