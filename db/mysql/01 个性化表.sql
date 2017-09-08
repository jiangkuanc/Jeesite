/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/11/15 11:13:21                          */
/*==============================================================*/

/*==============================================================*/
/* Table: cms_article                                           */
/* 个性化添加字段： speaker、audit_opinion、nthrough_reason、audit_time、auditor、review_opinions、nreview_reason、review_time、reauditor、status_code、activity_location、registration_way */
/*==============================================================*/
drop table if exists cms_article;
create table cms_article
(
   id                  varchar(64) not null comment 'id',
   category_id         varchar(64) comment '栏目编号',
   title               varchar(255) comment '标题',
   country             varchar(64) comment '国别',
   link                varchar(255) comment '文章链接',
   color               varchar(50) comment '标题颜色',
   image               varchar(255) comment '文章图片',
   keywords            varchar(255) comment '关键字',
   description         varchar(255) comment '描述、摘要',
   weight              int(11) default 0 comment '权重，越大越靠前',
   weight_date         datetime default NULL comment '权重期限',
   hits                int(11) default 0 comment '点击数',
   posid               varchar(10) comment '推荐位，多选',
   custom_content_view varchar(255) comment '自定义内容视图',
   related_enterprises varchar(255) comment '相关企业',
   project_scale       varchar(255) comment '项目规模',
   view_config         text comment '视图配置',
   create_by           varchar(64) comment '创建者',
   create_date         datetime default NULL comment '创建时间',
   update_by           varchar(64) comment '更新者',
   update_date         datetime default NULL comment '更新时间',
   remarks             varchar(255) comment '备注信息',
   del_flag            char(1) comment '删除标记',
   speaker             varchar(64) comment '讲堂作者',
   audit_opinion       varchar(64) character set utf8 comment '初审审核意见',
   nthrough_reason     varchar(64) character set utf8 default NULL comment '初审不通过原因',
   audit_time          datetime default NULL comment '初审审核时间',
   auditor             varchar(64) character set utf8 default NULL comment '初审审核人',
   review_opinions     varchar(64) character set utf8 default NULL comment '复审意见',
   nreview_reason      varchar(64) character set utf8 default NULL comment '复审不通过原因',
   review_time         datetime default NULL comment '复审时间',
   reauditor           varchar(64) character set utf8 default NULL comment '复审人',
   status_code         char(1) character set utf8 default NULL comment '状态码（1-待初审 2-初审通过 6-初审不通过 3-待复审状态 4-复审通过 7-复审不通过 5-文章发布状态）',
   activity_location   varchar(255) comment '活动地点',
   registration_way    varchar(255) comment '报名方式',
   primary key (id),
   key cms_article_create_by (create_by),
   key cms_article_title (title),
   key cms_article_keywords (keywords),
   key cms_article_del_flag (del_flag),
   key cms_article_weight (weight),
   key cms_article_update_date (update_date),
   key cms_article_category_id (category_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文章表';

alter table cms_article comment '文章表 cms_article';

/*==============================================================*/
/* Table: cms_creditactivity                                    */
/* 新增表：信用活动报名表                                       */
/*==============================================================*/
drop table if exists cms_creditactivity;
create table cms_creditactivity
(
    id                  varchar(64) not null comment 'id',
   article_id          varchar(64) comment '教育活动编号',
   user_id             varchar(64) comment '用户编号',
   real_name           varchar(64) comment '用户真实姓名',
   tel                 varchar(64) comment '手机号',
   registration_time   datetime comment '报名时间',
   primary key (id)
);

alter table cms_creditactivity comment '信用活动报名表 cms_creditactivity';

