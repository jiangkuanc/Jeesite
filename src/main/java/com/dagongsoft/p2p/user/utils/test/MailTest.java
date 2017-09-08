/*package com.dagongsoft.p2p.user.utils.test;

import java.util.Date;
import java.util.UUID;

import org.apache.commons.lang3.RandomStringUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import springTest.SpringDaoBaseTest;

import com.dagongsoft.p2p.user.utils.entity.MsgMailRecord;
import com.dagongsoft.p2p.user.utils.service.MsgMailRecordService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.UserService;

public class MailTest extends SpringDaoBaseTest{

	@Autowired
	public MsgMailRecordService msgMailRecordService;
	
	@Autowired
	public UserService userService;
	@Test
	public void test(){
		//SendMailUtil.sendCommonMail("hephec@126.com", "Subject", "测试邮箱");
		
		
		//Assert.isNull(msgMailRecordService.get("1001"));
		User user=userService.findOneUserFromId("0a139dc8083c4eafa12c5fece027d72e");
//		MsgMailRecord msgMailRecord= new MsgMailRecord();
//		msgMailRecord.setUser(new User("1"));
//		msgMailRecord.setMsgId("10021");
//		msgMailRecord.setTitle("测试邮箱");
//		msgMailRecord.setRecAddress("hephec@126.com");
//		msgMailRecord.setSendDate(new Date());
//		msgMailRecord.setSendState("1");
//		msgMailRecordService.save(msgMailRecord);
		
//		
//		MsgMailRecord msgMailRecord = new MsgMailRecord();
//		
//		msgMailRecord.setUser(new User("1"));
//		msgMailRecord.setMsgId("1001");
//		msgMailRecord.setSendDate(new Date());
//		msgMailRecord.setTitle("subject");
//		msgMailRecord.setMailContent("mailCodeATime.getCode()");
//		msgMailRecord.setRecAddress("toEmailAddress");
//		msgMailRecord.setSendState("1");		//1.已发送
//		msgMailRecordService.save(msgMailRecord);
		
		MsgMailRecord msgMailRecord = new MsgMailRecord();
		msgMailRecord.setUser(user);
		msgMailRecord.setMsgId(RandomStringUtils.randomAlphanumeric(4));
		msgMailRecord.setSendDate(new Date());
		msgMailRecord.setTitle("1");
		msgMailRecord.setMailContent("getCode");
		msgMailRecord.setRecAddress("zxz");
		msgMailRecord.setSendState("1");		//1.已发送
		msgMailRecordService.save(msgMailRecord);
		
		//msgMailRecordService.get(id)
		
	}
}
*/