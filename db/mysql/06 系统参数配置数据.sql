
/* 系统参数配置－测试数据  */
delete from sys_config where sys_id = 'dagongp2p' ;
INSERT INTO sys_config VALUES 
('D1', 'dagongp2p', '一带一路网站URL', 'TBAR_URL', 'http://localhost:8080/DG-JEESITE/a?login', '描述', 1),
('D2', 'dagongp2p', '是否启用密码错误次数超限锁定', 'CONSTANT_KEY01', '1', '描述', 2),
('D3', 'dagongp2p', '密码错误次数', 'CONSTANT_KEY02', '8', '描述', 3),
('D4', 'dagongp2p', '密码输入锁定时长', 'CONSTANT_KEY03', '24', '描述', 4),
('D5', 'dagongp2p', '网站状态', 'CONSTANT_KEY05', '1', '1开启；2关闭', 5),
('D6', 'dagongp2p', '网站关闭原因', 'CONSTANT_KEY06', '大公数据信息系统将于2016年5月1日16:00~19:00进行系统升级', '', 6),
('D7', 'dagongp2p', '上传图片大小', 'CONSTANT_KEY07', '1024', '单位:KB', 7),
('D8', 'dagongp2p', '上传图片扩展名', 'CONSTANT_KEY08', 'gif,jpg,jpeg,bmp,png,swf', '描述', 8),
('D9', 'dagongp2p', '首页banner图路径1', 'HOME1', '', '', 9),
('D10', 'dagongp2p', '首页banner图路径2', 'HOME2', '', '', 10),
('D11', 'dagongp2p', '首页banner图路径3', 'HOME3', '', '', 11),
('D12', 'dagongp2p', '发现banner图路径1', 'FIND1', '', '', 12),
('D13', 'dagongp2p', '发现banner图路径2', 'FIND2', '', '', 13),
('D14', 'dagongp2p', '发现banner图路径3', 'FIND3', '', '', 14);