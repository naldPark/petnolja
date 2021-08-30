package com.petnolja.member.model.service;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendAuth {

	public void sendAuth(String string, String email) {
		String host = "smtp.daum.net";
		String user = "admin@petnolja.xyz";
		String password = "password";
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			// 메일 제목
			message.setSubject("(주)펫놀자에서 인증번호 안내 드립니다");
			// 메일 내용
			message.setText("고객님의 인증번호는" + string + "입니다");
			// send the message
			Transport.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}

	}
}
