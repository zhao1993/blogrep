package com.blog.email;

import java.util.Date;
import java.util.Properties;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/**
 *
 */
public class SendEmail {
	private static String fromAccount = "zqdbyc@163.com";
	private static String fromUser = "个人博客";
	private static String fromPassword = "zaq163996";
	private static String smtpHost = "smtp.163.com";
	private static String toAccount = "zqdbyc@163.com";
	private static String title = "来自博客的建议和意见";
	
	public boolean sendEMail(String msg,String contact) throws Exception{
		Properties pros = new Properties();
		pros.setProperty("mail.transport.protocol", "smtp");
		pros.setProperty("mail.smtp.host",smtpHost);
		pros.setProperty("mail.smtp.auth", "true");
		Session session = Session.getDefaultInstance(pros);
		session.setDebug(true);
		MimeMessage message = createMessage(session, msg, contact);
		Transport transport = session.getTransport();
		transport.connect(fromAccount,fromPassword);
		transport.sendMessage(message,message.getAllRecipients());
		transport.close();
		return false;
	}
	public MimeMessage createMessage(Session sessoin,String msg,String contact) throws Exception{
		MimeMessage message = new MimeMessage(sessoin);
		message.setFrom(new InternetAddress(fromAccount,contact,"UTF-8"));
		message.setRecipient(MimeMessage.RecipientType.TO,new InternetAddress(toAccount,fromUser,"UTF-8"));
		message.setSubject(title,"UTF-8");
		message.setContent(msg+"<hr/>"+contact,"text/html;charset=UTF-8");
		message.setSentDate(new Date());
		message.saveChanges();
		return message;
	}
}
