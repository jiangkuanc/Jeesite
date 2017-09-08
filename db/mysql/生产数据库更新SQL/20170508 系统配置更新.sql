delete from sys_config where id in ('C1', 'C2', 'C3', 'C4', 'C5', 'C11');
INSERT INTO sys_config VALUES ('C1', 'dagongp2p', '外网用户密码更新周期(天)', 'extranet_password_update_cycle', '90', '单位：天', 11);
INSERT INTO sys_config VALUES ('C2', 'dagongp2p', '内网用户密码更新周期(天)', 'intranet_password_update_cycle', '90', '单位：天', 12);
INSERT INTO sys_config VALUES ('C3', 'dagongp2p', '更换密码N次内不能重复', 'password_update_rule', '3', '单位：次', 13);
INSERT INTO sys_config VALUES ('C4', 'dagongp2p', '密码最大尝试次数', 'password_max_wrong_times', '5', '单位：次', 14); 
INSERT INTO sys_config VALUES ('C5', 'dagongp2p', '账户冻结时间', 'account_freeze_minutes', '30', '单位：分钟', 15);
INSERT INTO sys_config VALUES ('C11', 'dagongp2p', '后台密码过期，是否可登录', 'password_be_overdue_is_can_login', '1', '1：可以登录；0：不可以登录', 16);

delete from sys_config where id in ('C6', 'C7', 'C8', 'C9', 'C10', 'C12');
INSERT INTO sys_config VALUES ('C6', 'RMP', '外网用户密码更新周期(天)', 'extranet_password_update_cycle', '90', '单位：天', 11);
INSERT INTO sys_config VALUES ('C7', 'RMP', '内网用户密码更新周期(天)', 'intranet_password_update_cycle', '90', '单位：天', 12);
INSERT INTO sys_config VALUES ('C8', 'RMP', '更换密码N次内不能重复', 'password_update_rule', '3', '单位：次', 13); 
INSERT INTO sys_config VALUES ('C9', 'RMP', '密码最大尝试次数', 'password_max_wrong_times', '5', '单位：次', 14); 
INSERT INTO sys_config VALUES ('C10', 'RMP', '账户冻结时间', 'account_freeze_minutes', '30', '单位：分钟', 15);
INSERT INTO sys_config VALUES ('C12', 'RMP', '后台密码过期，是否可登录', 'password_be_overdue_is_can_login', '1', '1：可以登录；0：不可以登录', 16);