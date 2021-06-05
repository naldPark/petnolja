package com.petnolja.member.model.service;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class SendSMS {

	public void sendSMS(String string, String tel) {
		final String ACCOUNT_SID = "AC4a98e4601e4e15c4ee1";
		final String AUTH_TOKEN = "88182296765745df124b";
		
		String temp = "+82"+tel.substring(1).replace("-", "");
		String sendMsg = "(주)펫놀자에서 인증번호("+string+")를 전송 했습니다";

		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

		Message message = Message
				.creator(new PhoneNumber(temp), 
						new PhoneNumber("+16108101368"), sendMsg).create();
	}

}
