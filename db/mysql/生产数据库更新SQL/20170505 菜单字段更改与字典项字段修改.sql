update sys_menu SET name = '数字化审计' WHERE id = 'M16';
update sys_menu SET name = '数字化审计' WHERE id = 'M50';

update sys_menu SET name = '评级分析' WHERE id = 'M7';

update sys_dict SET label = '数字化审计' WHERE id = 'PJ42';


DELETE FROM sys_menu WHERE id in('M83', 'M82', 'M50');
DELETE FROM sys_menu WHERE id in('M16', 'M81', 'M14');

INSERT INTO sys_menu VALUES ('M82', 'M1', '0,1,M1,', '数字化审计', 3, '', '', '', '1', '', '1', '2016-12-8 12:15:50', '1', '2016-12-8 12:15:50', '', '0');
INSERT INTO sys_menu VALUES ('M16', 'M82', '0,1,M1,M82,', '数字化审计', 2, '/setproject/rateProjectBasicInfo/rapList?currentNodeId=100', '', 'pencil', '1', 'setproject:ratingAnalyzingPlatformList:view', '1', '2016-12-8 12:15:50', '1', '2016-12-8 12:15:50', '', '0');


INSERT INTO sys_menu VALUES ('M81', 'M43', '0,1,M43,', '数字化审计', 1, '', '', '', '1', '', '1', '2016-12-8 12:15:50', '1', '2016-12-8 12:15:50', '', '0');
INSERT INTO sys_menu VALUES ('M14', 'M81', '0,1,M43,M81,', '首页', 1, '/ratinganalyzing/workingpapers/rateDataCompleteProgress/index', '', 'fire', '1', '', '1', '2016-12-8 12:15:50', '1', '2016-12-8 12:15:50', '', '0');
INSERT INTO sys_menu VALUES ('M50', 'M81', '0,1,M43,M81,', '数字化审计', 1, '/ratinganalyzing/workingpapers/rateDataCompleteProgress/auditPublicPages', '', 'pencil', '1', 'setproject:ratingAnalyzingPlatformList:view', '1', '2016-12-8 12:15:50', '1', '2016-12-8 12:15:50', '', '0');


