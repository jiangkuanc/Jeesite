
DROP TABLE IF EXISTS `sys_login_record`;
CREATE TABLE `sys_login_record` (
  `id` varchar(64) NOT NULL COMMENT '用户登录记录表',
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户编号',
  `login_name` varchar(255) DEFAULT NULL COMMENT '登录名称',
  `error_pwd_count` int(10) DEFAULT NULL COMMENT '密码输错次数',
  `frozen_state` varchar(6) DEFAULT NULL COMMENT '账号冻结状态（1-已冻结；0-未冻结）',
  `last_login_ip` varchar(64) DEFAULT NULL COMMENT '最后登录IP地址',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `frozen_start_time` datetime DEFAULT NULL COMMENT '账户冻结开始时间',
  `frozen_end_time` datetime DEFAULT NULL COMMENT '账户冻结结束时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录记录表';