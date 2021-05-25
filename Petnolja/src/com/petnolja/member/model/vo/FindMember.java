package com.petnolja.member.model.vo;

import java.sql.Date;

public class FindMember {
	
	private int memNo;
	private String memId;
	private String memName;
	private String memPwd;
	private String tempPwd;
	private String memTel;
	private String tempTel;
	private String memEmail;
	private String tempEmail;

	
	public FindMember() {}


	public FindMember(int memNo, String memId, String memName, String memPwd, String tempPwd, String memTel,
			String tempTel, String memEmail, String tempEmail) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memName = memName;
		this.memPwd = memPwd;
		this.tempPwd = tempPwd;
		this.memTel = memTel;
		this.tempTel = tempTel;
		this.memEmail = memEmail;
		this.tempEmail = tempEmail;
	}


	public int getMemNo() {
		return memNo;
	}


	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}


	public String getMemId() {
		return memId;
	}


	public void setMemId(String memId) {
		this.memId = memId;
	}


	public String getMemName() {
		return memName;
	}


	public void setMemName(String memName) {
		this.memName = memName;
	}


	public String getMemPwd() {
		return memPwd;
	}


	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}


	public String getTempPwd() {
		return tempPwd;
	}


	public void setTempPwd(String tempPwd) {
		this.tempPwd = tempPwd;
	}


	public String getMemTel() {
		return memTel;
	}


	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}


	public String getTempTel() {
		return tempTel;
	}


	public void setTempTel(String tempTel) {
		this.tempTel = tempTel;
	}


	public String getMemEmail() {
		return memEmail;
	}


	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}


	public String getTempEmail() {
		return tempEmail;
	}


	public void setTempEmail(String tempEmail) {
		this.tempEmail = tempEmail;
	}


	@Override
	public String toString() {
		return "FindMember [memNo=" + memNo + ", memId=" + memId + ", memName=" + memName + ", memPwd=" + memPwd
				+ ", tempPwd=" + tempPwd + ", memTel=" + memTel + ", tempTel=" + tempTel + ", memEmail=" + memEmail
				+ ", tempEmail=" + tempEmail + "]";
	}
	
	
	

}
	