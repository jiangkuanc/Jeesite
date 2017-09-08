
delete from sys_menu where id in ('403', '404', '405','406','409','410','411');
INSERT INTO sys_menu VALUES ('403', '401', '0,1,401,', '评级企业列表', 1, '/rating/ratingEnterprise', '', '', '1', '', '1', NOW(), '1', NOW(), '', '0');
INSERT INTO sys_menu VALUES ('404', '401', '0,1,401,', '材料审核', 1, '/rating/ratingDocumnetAudit', '', '', '1', '', '1', NOW(), '1', NOW(), '', '0');
INSERT INTO sys_menu VALUES ('405', '401', '0,1,401,', '评级初稿结果查询', 1, '/rating/ratingDraftSearch', '', '', '1', '', '1', NOW(), '1', NOW(), '', '0');
INSERT INTO sys_menu VALUES ('406', '401', '0,1,401,', '评级报告发布', 1, '/rating/ratingReportPublish', '', '', '1', '', '1', NOW(), '1', NOW(), '', '0');
INSERT INTO sys_menu VALUES ('409', '408', '0,1,401,', '信用记录维护', 2, '/creditmanage/creditRecordInfo', '', '', '1', 'creditmanage:creditRecordInfo:view', '1', NOW(), '1', NOW(), '', '0');
INSERT INTO sys_menu VALUES ('410', '408', '0,1,401,', '信用记录举报管理', 3, '/creditmanage/creditReportInfo', '', '', '1', 'creditmanage:creditReportInfo:view', '1', NOW(), '1', NOW(), '', '0');
INSERT INTO sys_menu VALUES ('411', '408', '0,1,401,', '信用记录申诉管理', 4, '/creditmanage/creditAppealInfo', '', '', '1', 'creditmanage:creditAppealInfo:view', '1', NOW(), '1', NOW(), '', '0');