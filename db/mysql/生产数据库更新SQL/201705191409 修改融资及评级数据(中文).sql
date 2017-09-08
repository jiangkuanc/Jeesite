DELETE from p2p_financing_information WHERE ID = 'DG6201705120005';
DELETE from p2p_financing_rating_info WHERE financing_information_id = 'DG6201705120005';

DELETE from p2p_rating_service_info;
DELETE from p2p_financing_rating_info WHERE financing_information_id like 'DG7%';

update p2p_reg_user_certify set real_name = '张三' where user_id = 'DGE000085';
update p2p_enterprise_certify set enterprise_name = '山东千云食品有限公司', name_of = '张三' where enterprise_name like '青岛千叶%';