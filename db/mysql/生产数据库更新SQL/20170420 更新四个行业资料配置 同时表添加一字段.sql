/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.62
Source Server Version : 50623
Source Host           : 192.168.1.62:3306
Source Database       : dagongp2p

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2017-04-20 17:55:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for p2p_rate_document_template
-- ----------------------------
DROP TABLE IF EXISTS p2p_rate_document_template;
CREATE TABLE p2p_rate_document_template (
  id varchar(64) NOT NULL COMMENT 'id',
  temp_type int(11) DEFAULT NULL COMMENT '模板类型',
  temp_name varchar(64) DEFAULT NULL COMMENT '模板名称',
  en_name varchar(64) DEFAULT NULL COMMENT '英文名称',
  industryNum varchar(16) DEFAULT NULL,
  temp_explain varchar(255) DEFAULT NULL,
  temp_address varchar(255) DEFAULT NULL,
  temp_sort varchar(64) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评级材料模板表 p2p_rate_document_template';

-- ----------------------------
-- Records of p2p_rate_document_template
-- ----------------------------
INSERT INTO p2p_rate_document_template VALUES ('1', '1', '公司章程', 'gszc', '0', '<p>1 、包括管理机制、管理机构、管理制度三个方面</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', '', '110');
INSERT INTO p2p_rate_document_template VALUES ('10', '2', '现金流量表', 'xjllb', '0', '<p>1 、提交最近三年完整报表</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '200');
INSERT INTO p2p_rate_document_template VALUES ('100', '1', '企业征信报告', 'qyyhzxbg4', 'M', '<p>1 、了解企业征信情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '130');
INSERT INTO p2p_rate_document_template VALUES ('101', '1', '企业组织架构图', 'qyzzjg4', 'M', '<p>1 、了解企业基本概况</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '150');
INSERT INTO p2p_rate_document_template VALUES ('102', '2', '资产负债表', 'gryhzxbg4', 'M', '<p>1 、提交最近三年完整报表</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '220');
INSERT INTO p2p_rate_document_template VALUES ('103', '2', '利润表', 'qycwbb4', 'M', '<p>1 、提交最近三年完整报表</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '230');
INSERT INTO p2p_rate_document_template VALUES ('104', '2', '企业增值税纳税申报表', 'qyzzsnssbb4', 'M', '<p>1 、了解企业的纳税情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '270');
INSERT INTO p2p_rate_document_template VALUES ('105', '2', '银行对账单', 'yhdzd4', 'M', '<p>1 、核实财务报表中的信息(期末)，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '300');
INSERT INTO p2p_rate_document_template VALUES ('106', '2', '销售和采购合同', 'dexshcght4', 'M', '<p>1 、了解企业主营业务收入及企业销售范围。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '330');
INSERT INTO p2p_rate_document_template VALUES ('107', '2', '企业所得税纳税申报表', 'qysdsnssbb4', 'M', '<p>1 、了解企业的纳税情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '280');
INSERT INTO p2p_rate_document_template VALUES ('108', '2', '优惠政策及补贴证明', 'yhzc4', 'M', '<p>1 、了解企业享受的补贴、税收优惠情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '320');
INSERT INTO p2p_rate_document_template VALUES ('109', '1', '专利证书和商标注册证', 'zlzs4', 'M', '<p>1 、了解企业知识产权/无形资产情况</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '200');
INSERT INTO p2p_rate_document_template VALUES ('11', '2', '所有者权益变动表', 'syzqybdb', '0', '<p>1 、提交最近三年完整报表</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '210');
INSERT INTO p2p_rate_document_template VALUES ('110', '1', '前五大产品清单', 'wdzlqd4', 'M', '<p>1 、了解企业前五大产品的技术含量</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '190');
INSERT INTO p2p_rate_document_template VALUES ('111', '1', '企业员工花名册', 'yghmc4', 'M', '<p>1 、了解在职员工基本情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '170');
INSERT INTO p2p_rate_document_template VALUES ('112', '2', '员工五险一金缴费凭证', 'ygwxyjjfpz4', 'M', '<p>1 、了解企业员工的养老保险费缴纳情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '310');
INSERT INTO p2p_rate_document_template VALUES ('113', '1', '实际控制人等人员简历', 'sjkzrjl4', 'M', '<p>1 、了解实际控制人、核心技术人员教育程度、相关行业工<p></p>作经历</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '160');
INSERT INTO p2p_rate_document_template VALUES ('114', '1', '核心技术人员离职记录表', 'ynjshxrylz4', 'M', '<p>1 、了解核心技术人员离职情况</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '180');
INSERT INTO p2p_rate_document_template VALUES ('115', '2', '实际控制人房产证', 'sjkzrfcz4', 'M', '<p>1 、了解实际控制人经济状况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '290');
INSERT INTO p2p_rate_document_template VALUES ('116', '2', '资金出借合同', 'zjcjht4', 'M', '<p>1 、了解企业借款利率、期限等信息。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '360');
INSERT INTO p2p_rate_document_template VALUES ('117', '1', '股权融资商业计划书', 'gqrzsyjhs4', 'M', '<p>1 、了解企业股权融资规模及占比</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '210');
INSERT INTO p2p_rate_document_template VALUES ('118', '2', '经营场所房产证', 'jycsfcz4', 'M', '<p>1 、了解经营场所稳定性，购置合同或租赁合同也可。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '340');
INSERT INTO p2p_rate_document_template VALUES ('12', '2', '科目余额表', 'kmyeb', '0', '<p>1 、1级 至 末级明细的期末借方余额和期末贷方余额</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '220');
INSERT INTO p2p_rate_document_template VALUES ('13', '2', '企业有息债务清单', 'qyyxzwqd', '0', '<p>1 、了解公司借款情况(期末)，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '230');
INSERT INTO p2p_rate_document_template VALUES ('14', '2', '资产抵质押情况清单', 'zcdzyqkqd', '0', '<p>1 、了解公司资产抵质押情况(期末)，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '240');
INSERT INTO p2p_rate_document_template VALUES ('15', '2', '银行对账单', 'ywxgyhdzd', '0', '<p>1 、核实财务报表中的信息(期末)，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '250');
INSERT INTO p2p_rate_document_template VALUES ('16', '2', '企业银行存款证明', 'ygwxyjjfpz', '0', '<p>1 、了解实际资产情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '260');
INSERT INTO p2p_rate_document_template VALUES ('17', '2', '企业所得税纳税申报表', 'qysdsnssbb', '0', '<p>1 、了解企业的纳税情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '270');
INSERT INTO p2p_rate_document_template VALUES ('18', '2', '研发费用&专利明细表', 'zlmxb', '0', '<p>1 、了解企业员工的失业保险费缴纳情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '280');
INSERT INTO p2p_rate_document_template VALUES ('19', '2', '补贴&优惠明细表', 'yhmxb', '0', '<p>1 、了解企业补贴及优惠详细情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '290');
INSERT INTO p2p_rate_document_template VALUES ('2', '1', '企业股东名单', 'qygdmd', '0', '<p>1 、了解公司股东构成情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '120');
INSERT INTO p2p_rate_document_template VALUES ('20', '2', '销售和采购合同', 'xshcght', '0', '<p>1 、了解企业销售范围，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '300');
INSERT INTO p2p_rate_document_template VALUES ('21', '2', '实际控制人所得税完税证明', 'sjkzrsdswszm', '0', '<p>1 、了解实际控制人的纳税情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '310');
INSERT INTO p2p_rate_document_template VALUES ('22', '2', '实际控制人社保缴费凭证', 'sjkzrsbjfpz', '0', '<p>1 、了解实际控制人社保缴纳情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '320');
INSERT INTO p2p_rate_document_template VALUES ('23', '2', '借款合同或单据', 'jkhthdj', '0', '<p>1 、了解企业借款利率、期限等信息，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '330');
INSERT INTO p2p_rate_document_template VALUES ('24', '2', '员工五险一金缴费凭证', 'ygwxyj', '0', '<p>1 、了解企业员工的养老保险费缴纳情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '340');
INSERT INTO p2p_rate_document_template VALUES ('25', '2', '财务年报附注', 'cwnbfz', '0', '<p>1 、与年报对应的附注材料，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '350');
INSERT INTO p2p_rate_document_template VALUES ('26', '3', '借贷产品基本信息', 'jbxx', '-1', null, null, null);
INSERT INTO p2p_rate_document_template VALUES ('27', '4', '其他材料', 'qtcl', '-2', null, null, '999');
INSERT INTO p2p_rate_document_template VALUES ('28', '1', '公司章程', 'gszc1', 'C', '<p>1 、包括管理机制、管理机构、管理制度三个方面</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '110');
INSERT INTO p2p_rate_document_template VALUES ('29', '1', '企业实际控制人征信报告', 'qyyyzz1', 'C', '<p>1 、1 了解实际控制人征信情况。实际控制人的界定：民营企<p></p>业为个人；国营企业是法定代表人。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '140');
INSERT INTO p2p_rate_document_template VALUES ('3', '1', '企业征信报告', 'qyzxbg', '0', '<p>1 、了解企业征信情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '130');
INSERT INTO p2p_rate_document_template VALUES ('30', '1', '企业股东名单', 'qygdmd1', 'C', '<p>1 、了解公司股东构成情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '120');
INSERT INTO p2p_rate_document_template VALUES ('31', '2', '实际控制人社保缴费凭证', 'sjgrsbjfpz1', 'C', '<p>1 、了解实际控制人社保缴纳情况</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '340');
INSERT INTO p2p_rate_document_template VALUES ('32', '1', '企业征信报告', 'qyyhzxbg1', 'C', '<p>1 、了解企业征信情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '130');
INSERT INTO p2p_rate_document_template VALUES ('33', '1', '企业组织架构图', 'qyzzjg1', 'C', '<p>1 、了解企业基本概况</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '150');
INSERT INTO p2p_rate_document_template VALUES ('34', '2', '资产负债表', 'gryhzxbg1', 'C', '<p>1 、提交最近三年完整报表</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '210');
INSERT INTO p2p_rate_document_template VALUES ('35', '2', '利润表', 'qycwbb1', 'C', '<p>1 、提交最近三年完整报表</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '220');
INSERT INTO p2p_rate_document_template VALUES ('36', '2', '企业增值税纳税申报表', 'qyzzsnssbb1', 'C', '<p>1 、了解企业的纳税情况</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '260');
INSERT INTO p2p_rate_document_template VALUES ('37', '2', '银行对账单', 'yhdzd1', 'C', '<p>1 、核实财务报表中的信息(期末)，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '280');
INSERT INTO p2p_rate_document_template VALUES ('38', '2', '销售和采购合同（包括相关单据）', 'dexshcght1', 'C', '<p>1 、佐证企业主营业务收入，了解企业销售范围。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '320');
INSERT INTO p2p_rate_document_template VALUES ('39', '2', '企业所得税纳税申报表', 'qysdsnssbb1', 'C', '<p>1 、了解企业的纳税情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '300');
INSERT INTO p2p_rate_document_template VALUES ('4', '1', '实际控制人征信报告', 'sjkzrzxbg', '0', '<p>1 、了解实际控制人征信情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '140');
INSERT INTO p2p_rate_document_template VALUES ('40', '1', '产品清单', 'qycpqd1', 'C', '<p>1 、了解企业前五大产品的技术含量</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '180');
INSERT INTO p2p_rate_document_template VALUES ('41', '1', '企业员工花名册', 'yghmc1', 'C', '<p>1 、了解在职员工基本情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '170');
INSERT INTO p2p_rate_document_template VALUES ('42', '2', '员工五险一金缴费凭证', 'ygwxyjjfpz1', 'C', '<p>1 、了解企业员工的养老保险费缴纳情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '290');
INSERT INTO p2p_rate_document_template VALUES ('43', '2', '借款合同或单据', 'yhjqtjkht1', 'C', '<p>1 、了解企业借款利率、期限等信息</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '330');
INSERT INTO p2p_rate_document_template VALUES ('44', '2', '环保补贴信息表', 'hbbtxxb1', 'C', '<p>1 、了解企业补贴期间、金额</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '310');
INSERT INTO p2p_rate_document_template VALUES ('45', '2', '实际控制人房产证', 'sjkzrfcz1', 'C', '<p>1 、了解实际控制人经济状况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '270');
INSERT INTO p2p_rate_document_template VALUES ('46', '1', '实际控制人等人员简历', 'sjkzrjl1', 'C', '<p>1 、了解实际控制人、核心技术人员教育程度、相关行业工<p></p>作经历。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '160');
INSERT INTO p2p_rate_document_template VALUES ('47', '2', '资金出借合同', 'zjcjht1', 'C', '<p>1 、了解企业借出款项的金额、利率、资本化利息、费用<p></p>化利息。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '350');
INSERT INTO p2p_rate_document_template VALUES ('48', '1', '股权融资商业计划书', 'gqrzsyjhs1', 'C', '<p>1 、了解企业股权融资规模及占比</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '200');
INSERT INTO p2p_rate_document_template VALUES ('49', '1', '产能利用情况信息表', 'cnlyqkxxb1', 'C', '<p>1 、了解企业产能利用情况</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '190');
INSERT INTO p2p_rate_document_template VALUES ('5', '1', '企业员工花名册', 'gggrzxbg', '0', '<p>1 、了解在职员工基本情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '150');
INSERT INTO p2p_rate_document_template VALUES ('50', '1', '公司章程', 'gszc2', 'F', '<p>1 、包括管理机制、管理机构、管理制度三个方面</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '110');
INSERT INTO p2p_rate_document_template VALUES ('51', '1', '企业实际控制人征信报告', 'qyyyzz2', 'F', '<p>1 、了解实际控制人征信情况。实际控制人的界定：民营企<p></p>业为个人；国营企业是法定代表人。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '140');
INSERT INTO p2p_rate_document_template VALUES ('52', '1', '企业股东名单', 'qygdmd2', 'F', '<p>1 、了解公司股东构成情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '120');
INSERT INTO p2p_rate_document_template VALUES ('53', '2', '实际控制人社保缴费凭证', 'sjgrsbjfpz2', 'F', '<p>1 、了解实际控制人的纳税情况。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '300');
INSERT INTO p2p_rate_document_template VALUES ('54', '1', '企业征信报告', 'qyyhzxbg2', 'F', '<p>1 、了解企业征信情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '130');
INSERT INTO p2p_rate_document_template VALUES ('55', '1', '企业组织架构图', 'qyzzjg2', 'F', '<p>1 、了解企业基本概况</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '150');
INSERT INTO p2p_rate_document_template VALUES ('56', '2', '资产负债表', 'gryhzxbg2', 'F', '<p>1 、提交最近三年完整报表</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '190');
INSERT INTO p2p_rate_document_template VALUES ('57', '2', '利润表', 'qycwbb2', 'F', '<p>1 、提交最近三年完整报表</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '200');
INSERT INTO p2p_rate_document_template VALUES ('58', '2', '企业增值税纳税申报表', 'qyzzsnssbb2', 'F', '<p>1 、了解企业的纳税情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '240');
INSERT INTO p2p_rate_document_template VALUES ('59', '2', '银行对账单', 'yhdzd2', 'F', '<p>1 、核实财务报表中的信息(期末)，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '270');
INSERT INTO p2p_rate_document_template VALUES ('6', '1', '公司制度清单', 'gszdqd', '0', '<p>1 、了解公司制度情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '160');
INSERT INTO p2p_rate_document_template VALUES ('60', '2', '大额销售和采购合同', 'dexshcght2', 'F', '<p>1 、了解企业主营业务收入与销售范围。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '290');
INSERT INTO p2p_rate_document_template VALUES ('61', '2', '企业所得税纳税申报表', 'qysdsnssbb2', 'F', '<p>1 、了解企业的纳税情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '250');
INSERT INTO p2p_rate_document_template VALUES ('62', '1', '企业员工花名册', 'yghmc2', 'F', '<p>1 、了解在职员工基本情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '170');
INSERT INTO p2p_rate_document_template VALUES ('63', '2', '员工五险一金缴费凭证', 'ygwxyjjfpz2', 'F', '<p>1 、了解企业员工的养老保险费缴纳情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '280');
INSERT INTO p2p_rate_document_template VALUES ('64', '1', '实际控制人等人员简历', 'sjkzrjl2', 'F', '<p>1 、了解实际控制人、核心技术人员教育程度、相关行业工<p></p>作经历。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '160');
INSERT INTO p2p_rate_document_template VALUES ('65', '2', '实际控制人房产证', 'sjkzrfcz2', 'F', '<p>1 、了解实际控制人经济状况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '260');
INSERT INTO p2p_rate_document_template VALUES ('66', '2', '经营场所房产证', 'jycsfcz2', 'F', '<p>1 、了解经营场所稳定性</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '320');
INSERT INTO p2p_rate_document_template VALUES ('67', '2', '水电费缴费单据', 'sdfjfdj2', 'F', '<p>1 、了解企业经营情况。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '330');
INSERT INTO p2p_rate_document_template VALUES ('68', '2', '资金出借合同', 'zjcjht2', 'F', '<p>1 、了解企业借款利率、期限等信息。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '310');
INSERT INTO p2p_rate_document_template VALUES ('69', '1', '股权融资商业计划书', 'gqrzsyjhs2', 'F', '<p>1 、了解企业股权融资规模及占比</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '180');
INSERT INTO p2p_rate_document_template VALUES ('7', '1', '实际控制人和高管简历', 'sjkzrhggjl', '0', '<p>1 、了解实际控制人和高管情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '170');
INSERT INTO p2p_rate_document_template VALUES ('70', '2', '现金流量表', 'sjkzrzcqk2', 'F', '<p>1 、提交最近三年完整报表</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '210');
INSERT INTO p2p_rate_document_template VALUES ('71', '1', '公司章程', 'gszc3', 'L', '<p>1 、包括管理机制、管理机构、管理制度三个方面</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '110');
INSERT INTO p2p_rate_document_template VALUES ('72', '1', '企业实际控制人征信报告', 'qyyyzz3', 'L', '<p>1 、了解实际控制人征信情况。实际控制人的界定：民营企<p></p>业为个人；国营企业是法定代表人。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '140');
INSERT INTO p2p_rate_document_template VALUES ('73', '1', '企业股东名单', 'qygdmd3', 'L', '<p>1 、了解公司股东构成情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '120');
INSERT INTO p2p_rate_document_template VALUES ('74', '2', '实际控制人社保缴费凭证', 'sjgrsbjfpz3', 'L', '<p>1 、了解实际控制人的纳税情况。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '340');
INSERT INTO p2p_rate_document_template VALUES ('75', '1', '企业征信报告', 'qyyhzxbg3', 'L', '<p>1 、了解企业征信情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '130');
INSERT INTO p2p_rate_document_template VALUES ('76', '1', '企业组织架构图', 'qyzzjg3', 'L', '<p>1 、了解企业基本概况</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '150');
INSERT INTO p2p_rate_document_template VALUES ('77', '2', '资产负债表', 'gryhzxbg3', 'L', '<p>1 、提交最近三年完整报表</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '220');
INSERT INTO p2p_rate_document_template VALUES ('78', '2', '利润表', 'qycwbb3', 'L', '<p>1 、提交最近三年完整报表</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '230');
INSERT INTO p2p_rate_document_template VALUES ('79', '2', '企业增值税纳税申报表', 'qyzzsnssbb3', 'L', '<p>1 、了解企业的纳税情况</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '270');
INSERT INTO p2p_rate_document_template VALUES ('8', '2', '资产负债表', 'zcfzb', '0', '<p>1 、提交最近三年完整报表</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '180');
INSERT INTO p2p_rate_document_template VALUES ('80', '2', '银行对账单', 'yhdzd3', 'L', '<p>1 、核实财务报表中的信息(期末)，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '300');
INSERT INTO p2p_rate_document_template VALUES ('81', '2', '大额销售和采购合同', 'dexshcght3', 'L', '<p>1 、了解企业主营业务收入与销售范围。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '330');
INSERT INTO p2p_rate_document_template VALUES ('82', '2', '企业所得税纳税申报表', 'qysdsnssbb3', 'L', '<p>1 、了解企业的纳税情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '280');
INSERT INTO p2p_rate_document_template VALUES ('83', '2', '合作两年以上客户清单', 'qyhzlnys3', 'L', '<p>1 、了解受评企业的主要客户。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '350');
INSERT INTO p2p_rate_document_template VALUES ('84', '2', '优惠政策及补贴证明', 'yhzc3', 'L', '<p>1 、了解企业享受的补贴、税收优惠情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '320');
INSERT INTO p2p_rate_document_template VALUES ('85', '1', '专利证书和商标注册证', 'zlzs3', 'L', '<p>1 、了解企业知识产权/无形资产情况</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '200');
INSERT INTO p2p_rate_document_template VALUES ('86', '1', '企业员工花名册', 'yghmc3', 'L', '<p>1 、了解在职员工基本情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '170');
INSERT INTO p2p_rate_document_template VALUES ('87', '2', '员工五险一金缴费凭证', 'ygwxyjjfpz3', 'L', '<p>1 、了解企业员工的养老保险费缴纳情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '310');
INSERT INTO p2p_rate_document_template VALUES ('88', '1', '实际控制人等人员简历', 'sjkzrjl3', 'L', '<p>1 、了解实际控制人、核心技术人员教育程度、相关行业工<p></p>作经历</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '160');
INSERT INTO p2p_rate_document_template VALUES ('89', '1', '核心技术人员离职记录表', 'hxjsrylz3', 'L', '<p>1 、了解核心技术人员离职情况</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '180');
INSERT INTO p2p_rate_document_template VALUES ('9', '2', '利润表', 'lrb', '0', '<p>1 、提交最近三年完整报表</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '190');
INSERT INTO p2p_rate_document_template VALUES ('90', '2', '实际控制人房产证', 'sjkzrfcz3', 'L', '<p>1 、了解实际控制人经济情况</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '290');
INSERT INTO p2p_rate_document_template VALUES ('91', '2', '经营场所房产证', 'jycsfcz3', 'L', '<p>1 、了解经营场所稳定性。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '370');
INSERT INTO p2p_rate_document_template VALUES ('92', '2', '水电费缴费单据', 'sdfdj3', 'L', '<p>1 、了解企业经营情况。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '380');
INSERT INTO p2p_rate_document_template VALUES ('93', '2', '资金出借合同', 'zjcjht3', 'L', '<p>1 、了解企业借款利率、期限等信息。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '360');
INSERT INTO p2p_rate_document_template VALUES ('94', '1', '股权融资商业计划书', 'gqrzsyjhs3', 'L', '<p>1 、了解企业股权融资规模及占比</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '210');
INSERT INTO p2p_rate_document_template VALUES ('95', '1', '员工专业资格证书', 'ygzyzgzscyzm3', 'L', '<p>1 、了解企业员工专业知识密集度</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '190');
INSERT INTO p2p_rate_document_template VALUES ('96', '1', '公司章程', 'gszc4', 'M', '<p>1 、包括管理机制、管理机构、管理制度三个方面</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '110');
INSERT INTO p2p_rate_document_template VALUES ('97', '1', '企业实际控制人征信报告', 'qyyyzz4', 'M', '<p>1 、了解实际控制人征信情况。实际控制人的界定：民营企<p></p>业为个人；国营企业是法定代表人。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '140');
INSERT INTO p2p_rate_document_template VALUES ('98', '1', '企业股东名单', 'qygdmd4', 'M', '<p>1 、了解公司股东构成情况，请提供扫描件</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '120');
INSERT INTO p2p_rate_document_template VALUES ('99', '2', '实际控制人社保缴费凭证', 'sjgrsbjfpz4', 'M', '<p>1 、了解实际控制人社保缴纳情况。</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '350');
INSERT INTO p2p_rate_document_template VALUES ('c1', '2', '现金流量表', 'xjll1', 'C', '<p>1 、提交最近三年完整报表</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '230');
INSERT INTO p2p_rate_document_template VALUES ('c2', '2', '所有者权益变动表', 'syzqybdb1', 'C', '<p>1 、提交最近三年完整报表</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '240');
INSERT INTO p2p_rate_document_template VALUES ('c3', '2', '财务年报附注', 'cwnbfz1', 'C', '<p>1 、与年报对应的附注材料，如年报中已包含，则无需上传</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '250');
INSERT INTO p2p_rate_document_template VALUES ('f1', '2', '所有者权益变动表', 'ssyzqybdb2', 'F', '<p>1 、提交最近三年完整报表</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '220');
INSERT INTO p2p_rate_document_template VALUES ('f2', '2', '财务年报附注', 'cwnbfz2', 'F', '<p>1 、 与年报对应的附注材料，如年报中已包含，则无需上传</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '230');
INSERT INTO p2p_rate_document_template VALUES ('l1', '2', '现金流量表', 'yjllb3', 'L', '<p>1 、提交最近三年完整报表</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '240');
INSERT INTO p2p_rate_document_template VALUES ('l2', '2', '所有者权益变动表', 'syzqybdb3', 'L', '<p>1 、提交最近三年完整报表</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '250');
INSERT INTO p2p_rate_document_template VALUES ('l3', '2', '财务年报附注', 'cwnbfz', 'L', '<p>1 、与年报对应的附注材料，如年报中已包含，则无需上传</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '260');
INSERT INTO p2p_rate_document_template VALUES ('m1', '2', '现金流量表', 'xjllb4', 'M', '<p>1 、提交最近三年完整报表</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '240');
INSERT INTO p2p_rate_document_template VALUES ('m2', '2', '所有者权益变动表', 'syzqybdb4', 'M', '<p>1 、提交最近三年完整报表</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '250');
INSERT INTO p2p_rate_document_template VALUES ('m3', '2', '财务年报附注', 'cwnbfz4', 'M', '<p>1 、与年报对应的附注材料，如年报中已包含，则无需上传</p><p>2 、支持.jpg .jpeg .png .bmp的图片格式，大小不超过5M</p>', null, '260');
