#20170522执行过
UPDATE p2p_rating_service_info SET current_stage = '400' WHERE id = 'DG7201705190003';
UPDATE p2p_rating_service_info SET current_stage = '400' WHERE id = 'DG7201705190004';
#20170523执行过
#删除ab公司的融资信息
delete from p2p_financing_information where id in ('DG6201705220001', 'DG6201705220002');
#删除ab公司在评级信息表中的信息
delete from p2p_financing_rating_info where  financing_information_id in ('DG6201705220001', 'DG6201705220002');
#更改a公司和b公司的主体评级状态为，确认评级结果
UPDATE p2p_rating_service_info SET current_stage = '400' WHERE id = 'DG7201705190001';
UPDATE p2p_rating_service_info SET current_stage = '400' WHERE id = 'DG7201705190002';