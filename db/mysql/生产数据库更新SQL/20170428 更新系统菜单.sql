
delete from sys_menu where id in ('288', '289', '290','291','292');
INSERT INTO sys_menu VALUES ('288', '41', '0,1,31,40,41,', '内容修改', 1, '/cms/', '', '', '0', 'content:modification', '1', NOW(), '1', NOW(), NULL, '0');
INSERT INTO sys_menu VALUES ('289', '41', '0,1,31,40,41,', '内容删除', 1, '/cms/', '', '', '0', 'content:deletion', '1', NOW(), '1', NOW(), NULL, '0');
INSERT INTO sys_menu VALUES ('290', '41', '0,1,31,40,41,', '内容初审', 1, '/cms/', '', '', '0', 'content:review', '1', NOW(), '1', NOW(), NULL, '0');
INSERT INTO sys_menu VALUES ('291', '41', '0,1,31,40,41,', '内容复审', 1, '/cms/', '', '', '0', 'Content:rehear', '1', NOW(), '1', NOW(), NULL, '0');
INSERT INTO sys_menu VALUES ('292', '41', '0,1,31,40,41,', '内容发布', 1, '/cms/', '', '', '0', 'content:publishing', '1', NOW(), '1', NOW(), NULL, '0');