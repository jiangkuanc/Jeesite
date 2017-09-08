ALTER TABLE p2p_investment_details ADD investment_user_id VARCHAR(64) COMMENT '个人用户id或者机构用户id';
ALTER TABLE p2p_payment_of_rating_cost ADD user_order_time datetime COMMENT '用户提出购买，在通联生成订单时间';
ALTER TABLE p2p_payment_of_rating_cost  ADD del_flag TINYINT COMMENT '0正常1删除';