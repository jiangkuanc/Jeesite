
/* 举报测试数据  */
delete from p2p_report_information_audit;
INSERT INTO p2p_report_information_audit  VALUES ('1', 'DGE000001', 'A01', '1', '1', '1', 'zzzzzz', '举报内容', '2016-12-08 16:12:38', 'zzz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL);
INSERT INTO p2p_report_information_audit  VALUES ('2', 'DGE000001', 'A02', '1', '1', '1', 'zzzzzz', '举报内容', '2016-12-08 16:12:38', 'zzz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL);
/* 申诉测试数据  */
delete from p2p_information_appeal;
INSERT INTO p2p_information_appeal VALUES ('1', 'DGE000001', 'A01', '1', '1', '1', 'zzzz', '2016-12-07 16:49:19', 'zzz', 'zzzz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO p2p_information_appeal VALUES ('2', 'DGE000001', 'A02', '1', '1', '1', 'zzzz', '2016-12-07 16:49:19', 'zzz', 'zzzz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1');
/* 信用报告测试数据  */
delete from p2p_credit_report;
INSERT INTO p2p_credit_report VALUES ('A01', 'DGE000012', '百度', '融资企业', 'A02', '企业介绍', '0', '2016-11-29 11:23:52', 'AA+', '2016-11-30', '大公集团做客观评级', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19');
INSERT INTO p2p_credit_report VALUES ('A02', 'DGE000013', '三星', '融资企业', 'A04', '企业介绍', '0', '2016-12-1 11:29:53', 'AAA', '2016-12-2', '大公集团做客观评级大公集团做客观评级', '1', '2', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

/* 信用报告记录测试数据  */
delete from p2p_credit_report_data;
insert  into `p2p_credit_report_data`(`id`,`credit_report_id`,`index_id`,good,normal,risk)  values
('1', 'A01', '1',13,11,7), 
('2', 'A01', '2',26,8,2), 
('3', 'A01', '3',7,7,1), 
('4', 'A01', '4',8,6,4), 
('5', 'A01', '5',3, 5,3),
('6', 'A01', '6',7, 6,5),
('7', 'A01', '7',8, 1,3),
('8', 'A01', '8',6, 5,4),
('9', 'A01', '9',3,11,12),
('10', 'A01', '10',2,12,12),
('11', 'A01', '11',5,32,3),
('12', 'A01', '12',8,23,43),
('13', 'A01', '13',3,21,22),
('14', 'A01', '14',1,23,34),
('15', 'A01', '15',8,1,12),
('16', 'A01', '16',3,2,23),
('17', 'A01', '17',4,32,11),

('18', 'A02', '1',13,11,7), 
('19', 'A02', '2',26,8,2), 
('20', 'A02', '3',7,7,1), 
('21', 'A02', '4',8,6,4), 
('22', 'A02', '5',3, 5,3),
('23', 'A02', '6',7, 6,5),
('24', 'A02', '7',8, 1,3),
('25', 'A02', '8',6, 5,4),
('26', 'A02', '9',3,11,12),
('27', 'A02', '10',2,12,12),
('28', 'A02', '11',5,32,3),
('29', 'A02', '12',8,23,43),
('30', 'A02', '13',3,21,22),
('31', 'A02', '14',1,23,34),
('32', 'A02', '15',8,1,12),
('33', 'A02', '16',3,2,23),
('34', 'A02', '17',4,32,11);

/* 融资信息－测试数据  */
delete from p2p_financing_information where id = 'DG4201612060001'; 
INSERT INTO p2p_financing_information VALUES ('DG4201612060001', '百度公司一期融资', 'DGE000012', '800', '2016-12-6 11:50:59', '2016-12-6 11:51:03', NULL, 6, 560000, 0.0800, 500000, 0.0700, 5, '3', '2', '美国末日2最后生还者项目第一阶段开发工作费用', NULL, NULL, NULL, NULL, 500000, 0, '500000', 1, 1, '0', '2016-12-1 11:54:15', NULL, '2016-12-5 11:54:36', NULL, NULL, NULL, NULL, NULL, '0');

/* 充值－测试数据  */
delete from p2p_account_recharge_record;
insert  into p2p_account_recharge_record value 
('2016120612250001', 'DGP000001', 6000, NOW(), '2', NOW()),
('2016120612250002', 'DGP000001', 4000, NOW(), '2', NOW()),
('2016120612250005', 'DGE000012', 5000, NOW(), '2', NOW()), 
('2016120612250006', 'DGE000012', 3000, NOW(), '1', NOW());

/* 提现－测试数据  */
delete from p2p_account_withdraw_record;
insert  into p2p_account_withdraw_record value 
('2016120612250001', 'DGP000001', 6000, NOW(), '2', NOW(), 10),
('2016120612250002', 'DGP000001', 4000, NOW(), '2', NOW(), 10),
('2016120612250005', 'DGE000012', 5000, NOW(), '2', NOW(), 5), 
('2016120612250006', 'DGE000012', 3000, NOW(), '1', NOW(), 5);


/* 账户表－测试数据  */
delete from p2p_account where user_id in('DGE000012', 'DGP000001'); 
INSERT INTO p2p_account VALUES ('1', 'DGE000012', NULL, NULL, NULL, NULL, '6228480020121212129', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO p2p_account VALUES ('2', 'DGP000001', NULL, NULL, NULL, NULL, '6228480020121212128', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');

