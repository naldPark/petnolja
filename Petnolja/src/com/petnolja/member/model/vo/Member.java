package com.petnolja.member.model.vo;

import java.sql.Date;

public class Member {
	
	private int memNo;
	private String memId;
	private String memName;
	private String memPwd;
	private String memTel;
	private String memEmail;
	private String memAddress;
	private String memDetailAddress;
	private Date memEnrollDate;
	private String memStatus;
	private Date memDeleteDate;
	private String memDeleteDetail;
	private String memAds;
	private String memBlock;
	private String memReport;
	private String memReportDetail;
	
	public Member() {}

	public Member(int memNo, String memId, String memName, String memPwd, String memTel, String memEmail,
			String memAddress, String memDetailAddress, Date memEnrollDate, String memStatus, Date memDeleteDate,
			String memDeleteDetail, String memAds, String memBlock, String memReport, String memReportDetail) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memName = memName;
		this.memPwd = memPwd;
		this.memTel = memTel;
		this.memEmail = memEmail;
		this.memAddress = memAddress;
		this.memDetailAddress = memDetailAddress;
		this.memEnrollDate = memEnrollDate;
		this.memStatus = memStatus;
		this.memDeleteDate = memDeleteDate;
		this.memDeleteDetail = memDeleteDetail;
		this.memAds = memAds;
		this.memBlock = memBlock;
		this.memReport = memReport;
		this.memReportDetail = memReportDetail;
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

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemTel() {
		return memTel;
	}

	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemAddress() {
		return memAddress;
	}

	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}

	public String getMemDetailAddress() {
		return memDetailAddress;
	}

	public void setMemDetailAddress(String memDetailAddress) {
		this.memDetailAddress = memDetailAddress;
	}

	public Date getMemEnrollDate() {
		return memEnrollDate;
	}

	public void setMemEnrollDate(Date memEnrollDate) {
		this.memEnrollDate = memEnrollDate;
	}

	public String getMemStatus() {
		return memStatus;
	}

	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}

	public Date getMemDeleteDate() {
		return memDeleteDate;
	}

	public void setMemDeleteDate(Date memDeleteDate) {
		this.memDeleteDate = memDeleteDate;
	}

	public String getMemDeleteDetail() {
		return memDeleteDetail;
	}

	public void setMemDeleteDetail(String memDeleteDetail) {
		this.memDeleteDetail = memDeleteDetail;
	}

	public String getMemAds() {
		return memAds;
	}

	public void setMemAds(String memAds) {
		this.memAds = memAds;
	}

	public String getMemBlock() {
		return memBlock;
	}

	public void setMemBlock(String memBlock) {
		this.memBlock = memBlock;
	}

	public String getMemReport() {
		return memReport;
	}

	public void setMemReport(String memReport) {
		this.memReport = memReport;
	}

	public String getMemReportDetail() {
		return memReportDetail;
	}

	public void setMemReportDetail(String memReportDetail) {
		this.memReportDetail = memReportDetail;
	}

	@Override
	public String toString() {
		return "Member [memNo=" + memNo + ", memId=" + memId + ", memName=" + memName + ", memPwd=" + memPwd
				+ ", memTel=" + memTel + ", memEmail=" + memEmail + ", memAddress=" + memAddress + ", memDetailAddress="
				+ memDetailAddress + ", memEnrollDate=" + memEnrollDate + ", memStatus=" + memStatus
				+ ", memDeleteDate=" + memDeleteDate + ", memDeleteDetail=" + memDeleteDetail + ", memAds=" + memAds
				+ ", memBlock=" + memBlock + ", memReport=" + memReport + ", memReportDetail=" + memReportDetail + "]";
	}

	

}
	