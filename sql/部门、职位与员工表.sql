# 部门表
CREATE TABLE t_dept(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	dname VARCHAR(20) NOT NULL COMMENT "部门名称",
	UNIQUE unq_dname(dname)
) COMMENT = "部门表";


# 职位表
CREATE TABLE t_job(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	job VARCHAR(20) NOT NULL COMMENT "职位名称",
	UNIQUE unq_dname(job)
) COMMENT = "职位表";


# 员工表
CREATE TABLE t_emp(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
	wid VARCHAR(20) NOT NULL COMMENT "工号",
	ename VARCHAR(20) NOT NULL COMMENT "姓名",
	sex CHAR(1) NOT NULL COMMENT "性别",
	married BOOLEAN NOT NULL COMMENT "婚否",
	education TINYINT NOT NULL COMMENT "学历：1大专，2本科，3研究生，4博士，5其他",
	tel CHAR(11) NOT NULL COMMENT "电话",
	email VARCHAR(200) COMMENT "邮箱",
	address VARCHAR(200) COMMENT "住址",
	job_id INT UNSIGNED NOT NULL COMMENT "职务ID",
	dept_id INT UNSIGNED NOT NULL COMMENT "部门ID",
	mgr_id INT UNSIGNED COMMENT "上司ID",
	hiredate DATE NOT NULL COMMENT "入职日期",
	termdate DATE COMMENT "离职日期",
	`status` TINYINT UNSIGNED NOT NULL COMMENT "状态：1在职，2休假，3离职，4死亡",
	INDEX idx_job_id(job_id),
	INDEX idx_dept_id(dept_id),
	INDEX idx_status(`status`),
	INDEX idx_mgr_id(mgr_id),
	INDEX idx_wid(wid),
	UNIQUE unq_wid(wid)
) COMMENT = "员工表";