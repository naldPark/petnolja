package com.petnolja.member.model;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class SendSms {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		  final String ACCOUNT_SID = "AC4a98e4601e4e15c4ee1b3ccbcce28394";
		  final String AUTH_TOKEN = "88182296765745df124bea1604f4ee47";

		    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

		    Message message = Message.creator(new PhoneNumber("+821091543073"),
		        new PhoneNumber("+16108101368"), 
		        "한솔님 안녕하세요 ????").create();

		    System.out.println(message.getSid());

	}

}
