delete from sys_menu where id = 'M83';
insert  into sys_menu(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('M83','67','0,1,2,67,','非法登录查询','1','/sys/erroLog',NULL,'pencil','1','','1',NOW(),'1',NOW(),NULL,'0');

