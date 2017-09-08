DELETE from p2p_financing_information WHERE ID = 'DG6201705130008';
DELETE from p2p_financing_rating_info WHERE financing_information_id = 'DG6201705130008';

DELETE from p2p_rating_service_info;
DELETE from p2p_financing_rating_info WHERE financing_information_id like 'DG7%';

update p2p_reg_user_certify set real_name = 'Tom' where user_id = 'DGE000022';
update p2p_enterprise_certify set enterprise_name = 'Shandong Qianyun Foodstuff Co., Ltd.', name_of = 'Tom' where enterprise_name like 'Qingdao Cheun Jep Foodstuff Co., Ltd.%';