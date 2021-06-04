package com.petnolja.admin.model.vo;

import java.util.Date;

public class Deal {
	private int resNo;
	private String memId;
	private String SitterId;
	private String resCheckinDate;
	private Date resDate;
	private String resStatus;
	private int payAmount;
	
	public Deal() {};
	
	public Deal(int resNo, String memId, String sitterId, String resCheckinDate, Date resDate, String resStatus,
			int payAmount) {
		super();
		this.resNo = resNo;
		this.memId = memId;
		SitterId = sitterId;
		this.resCheckinDate = resCheckinDate;
		this.resDate = resDate;
		this.resStatus = resStatus;
		this.payAmount = payAmount;
	}

	public int getResNo() {
		return resNo;
	}

	public void setRes_no(int resNo) {
		this.resNo = resNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getSitterId() {
		return SitterId;
	}

	public void setSitterId(String sitterId) {
		SitterId = sitterId;
	}

	public String getResCheckinDate() {
		return resCheckinDate;
	}

	public void setResCheckinDate(String resCheckinDate) {
		this.resCheckinDate = resCheckinDate;
	}

	public Date getResDate() {
		return resDate;
	}

	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}

	public String getResStatus() {
		return resStatus;
	}

	public void setResStatus(String resStatus) {
		this.resStatus = resStatus;
	}

	public int getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}

	@Override
	public String toString() {
		return "Deal [resNo=" + resNo + ", memId=" + memId + ", SitterId=" + SitterId + ", resCheckinDate="
				+ resCheckinDate + ", resDate=" + resDate + ", resStatus=" + resStatus + ", payAmount=" + payAmount
				+ "]";
	}

}


