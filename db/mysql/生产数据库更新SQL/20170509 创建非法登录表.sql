DROP TABLE IF EXISTS `sys_error_login_log`;
CREATE TABLE sys_error_login_log (
	id  VARCHAR(64) COMMENT '主键',
	login_name  VARCHAR(128) NOT NULL COMMENT '登录名',
	error_pwd  VARCHAR(72) COMMENT '输入的错误密码',
	log_ip	VARCHAR(64) COMMENT '记录登录ip地址',
	pc_mac VARCHAR(128) COMMENT '登录错误的物理机',
	login_time DATETIME  NOT NULL  COMMENT '登录错误的时间',
	user_role TINYINT COMMENT '1为后台用户2为前台用户',
	PRIMARY KEY (`id`)
)ENGINE=MyISAM AUTO_INCREMENT=145 DEFAULT CHARSET=utf8  COMMENT '登录失败信息记录表';
