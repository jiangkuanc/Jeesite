delete FROM cms_category;

INSERT INTO cms_category VALUES 
('1', '0', '0,', '0', '1', NULL, '顶级栏目', NULL, NULL, NULL, NULL, NULL, 0, '1', '1', '0', '0', '1', NULL, NULL, NULL, '1', NOW(), '1', NOW(), NULL, '0'), 
	('79', '1', '0,1,', '1', '1', 'article', '服务平台', '', '', '', '', '', 1, '1', '1', '0', '0', '1', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('32', '79', '0,1,79,', '1', '1', '', '信用教育', '', '', '', '', '', 1, '1', '1', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
			('29', '32', '0,1,79,32,', '1', '1', 'article', '信用教育讲堂', '', '/financing/findDocumentAuditList', '', '', '', 1, '1', '1', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
			('30', '32', '0,1,79,32,', '1', '1', 'link', '信用教育视频', '', '', '', '', '', 2, '1', '1', '0', '1', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
			('31', '32', '0,1,79,32,', '1', '1', 'article', '信用教育活动-进行中', '', '', '', '', '', 3, '1', '1', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
			('84', '32', '0,1,79,32,', '1', '1', 'article', '信用教育活动-已完成', '', '', '', '', '', 4, '0', '0', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('24', '79', '0,1,79,', '1', '1', 'article', '平台公告', '', 'http://www.baidu.com', '_blank', '', '', 2, '1', '1', '0', '1', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('25', '79', '0,1,79,', '1', '1', '', '全文检索', NULL, '/search', NULL, NULL, NULL, 3, '0', '0', '0', '1', '0', NULL, NULL, NULL, '1', NOW(), '1', NOW(), NULL, '0'), 
		
	('10', '1', '0,1,', '1', '1', 'article', '一带一路网站', '', '', '', '', '', 2, '1', '1', '0', '1', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('63', '10', '0,1,10,', '1', '1', 'article', '资讯', '', '', '', '', '', 1, '0', '0', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('14', '10', '0,1,10,', '1', '1', 'article', '政策', '', '', '', '', '', 2, '1', '1', '0', '1', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('71', '10', '0,1,10,', '1', '1', 'article', '商务服务', '', '', '', '', '', 3, '0', '1', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('70', '10', '0,1,10,', '1', '1', 'article', '产品', '', '', '', '', '', 4, '0', '0', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('61', '10', '0,1,10,', '1', '1', 'article', '报告', '', '', '', '', '', 5, '0', '0', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('73', '10', '0,1,10,', '1', '1', 'article', '资讯-国内要闻', '', '', '', '', '', 5, '0', '0', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('74', '10', '0,1,10,', '1', '1', 'article', '资讯-国际要闻', '', '', '', '', '', 6, '0', '0', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('75', '10', '0,1,10,', '1', '1', 'article', '资讯-高层声音', '', '', '', '', '', 7, '0', '0', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('76', '10', '0,1,10,', '1', '1', 'article', '资讯-地方举措', '', '', '', '', '', 8, '0', '0', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('77', '10', '0,1,10,', '1', '1', 'article', '资讯-专家视点', '', '', '', '', '', 9, '0', '0', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('13', '10', '0,1,10,', '1', '1', 'article', '法律法规', '', '', '', '', '', 10, '1', '1', '0', '1', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('60', '10', '0,1,10,', '1', '1', 'article', '项目招标', '', '', '', '', '', 11, '0', '0', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('62', '10', '0,1,10,', '1', '1', 'article', '重大项目', '', '', '', '', '', 12, '0', '0', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('78', '10', '0,1,10,', '1', '1', 'article', '一带一路政策', '', '', '', '', '', 13, '0', '1', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('81', '10', '0,1,10,', '1', '1', 'article', '机构', '', '', '', '', '', 14, '0', '1', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('83', '10', '0,1,10,', '1', '1', 'article', '政策法规', '', '', '', '', '', 15, '0', '1', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '1'), 

	('6', '1', '0,1,', '1', '1', 'article', '我要融资(待删除)', NULL, NULL, NULL, NULL, NULL, 3, '1', '1', '1', '1', '0', NULL, NULL, NULL, '1', NOW(), '1', NOW(), NULL, '0'), 
		('7', '6', '0,1,6,', '1', '1', 'article', '产品质量', NULL, NULL, NULL, NULL, NULL, 1, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', NOW(), '1', NOW(), NULL, '0'), 
		('8', '6', '0,1,6,', '1', '1', 'article', '技术质量', NULL, NULL, NULL, NULL, NULL, 2, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', NOW(), '1', NOW(), NULL, '0'), 
		('9', '6', '0,1,6,', '1', '1', 'article', '工程质量', NULL, NULL, NULL, NULL, NULL, 3, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', NOW(), '1', NOW(), NULL, '0'), 

	
	('2', '1', '0,1,', '1', '1', 'article', '投资管理(待删除)', '', '', '', '', '', 4, '1', '1', '0', '0', '1', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('3', '2', '0,1,2,', '1', '1', 'article', '网站简介', NULL, NULL, NULL, NULL, NULL, 1, '1', '1', '0', '0', '1', NULL, NULL, NULL, '1', NOW(), '1', NOW(), NULL, '0'), 
		('4', '2', '0,1,2,', '1', '1', 'article', '内部机构', NULL, NULL, NULL, NULL, NULL, 2, '1', '1', '0', '0', '1', NULL, NULL, NULL, '1', NOW(), '1', NOW(), NULL, '0'), 
		('5', '2', '0,1,2,', '1', '1', 'article', '地方机构', NULL, NULL, NULL, NULL, NULL, 3, '1', '1', '0', '0', '1', NULL, NULL, NULL, '1', NOW(), '1', NOW(), NULL, '0'), 

	('85', '1', '0,1,', '1', '1', 'article', '国家及地方人文地理(待删除)', '', '', '', '', '', 5, '0', '0', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('86', '85', '0,1,85,', '1', '1', '', '国内', '', '', '', '', '', 1, '0', '0', '0', '0', '0', '', '', '', '1', '2016-8-12 15:56:20', '1', NOW(), NULL, '0'), 
		('87', '85', '0,1,85,', '1', '1', '', '国外', '', '', '', '', '', 2, '0', '0', '0', '0', '0', '', '', '', '1', '2016-8-12 15:56:40', '1', NOW(), NULL, '0'), 

	('80', '1', '0,1,', '1', '1', 'article', '其它栏目(待删除)', '', '', '', '', '', 6, '1', '1', '0', '1', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('11', '80', '0,1,80,', '1', '1', 'article', '政府咨询', '', '', '', '', '', 1, '1', '1', '0', '1', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('64', '80', '0,1,80,', '1', '1', 'article', '投资指南', '', '', '', '', '', 2, '0', '1', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('65', '80', '0,1,80,', '1', '1', 'article', '人文概述', '', '', '', '', '', 3, '0', '1', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('66', '80', '0,1,80,', '1', '1', 'article', '文化交流', '', '', '', '', '', 4, '0', '1', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('67', '80', '0,1,80,', '1', '1', 'article', '丝路战略研究', '', '', '', '', '', 5, '0', '0', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('68', '80', '0,1,80,', '1', '1', 'article', '融资信息', '', '', '', '', '', 6, '0', '1', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('69', '80', '0,1,80,', '1', '1', 'article', '丝路债券', '', '', '', '', '', 7, '0', '1', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('82', '80', '0,1,80,', '1', '1', 'article', '国外介绍', '', '', '', '', '', 8, '0', '0', '0', '0', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('12', '80', '0,1,80,', '1', '1', 'article', '投资动态', '', '', '', '', '', 9, '1', '1', '0', '1', '0', '', '', '', '1', NOW(), '1', NOW(), NULL, '0'), 
		('15', '80', '0,1,80,', '1', '1', 'article', '邮件处理', NULL, NULL, NULL, NULL, NULL, 10, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', NOW(), '1', NOW(), NULL, '0'), 
		('16', '80', '0,1,80,', '1', '1', 'article', '下载工具', NULL, NULL, NULL, NULL, NULL, 11, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', NOW(), '1', NOW(), NULL, '0'), 
		('17', '80', '0,1,80,', '1', '1', 'article', '搜索工具', NULL, NULL, NULL, NULL, NULL, 12, '1', '1', '2', '1', '0', NULL, NULL, NULL, '1', NOW(), '1', NOW(), NULL, '0'), 
		
	('18', '1', '0,1,', '1', '1', 'link', '友情链接(待删除)', NULL, NULL, NULL, NULL, NULL, 7, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', NOW(), '1', NOW(), NULL, '0'), 
		('19', '18', '0,1,18,', '1', '1', 'link', '常用网站', NULL, NULL, NULL, NULL, NULL, 50, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', NOW(), '1', NOW(), NULL, '0'), 
		('20', '18', '0,1,18,', '1', '1', 'link', '门户网站', NULL, NULL, NULL, NULL, NULL, 50, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', NOW(), '1', NOW(), NULL, '0'), 
		('21', '18', '0,1,18,', '1', '1', 'link', '购物网站', NULL, NULL, NULL, NULL, NULL, 50, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', NOW(), '1', NOW(), NULL, '0'), 
		('22', '18', '0,1,18,', '1', '1', 'link', '交友社区', NULL, NULL, NULL, NULL, NULL, 50, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', NOW(), '1', NOW(), NULL, '0'), 
		('23', '18', '0,1,18,', '1', '1', 'link', '音乐视频', NULL, NULL, NULL, NULL, NULL, 50, '1', '1', '0', '1', '0', NULL, NULL, NULL, '1', NOW(), '1', NOW(), NULL, '0');



	
	