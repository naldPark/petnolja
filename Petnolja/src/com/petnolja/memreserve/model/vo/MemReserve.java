package com.petnolja.memreserve.model.vo;

import java.sql.Date;

public class MemReserve {
	
	private int sitterNo;
	private String sitterTitle;
	private String memName;
	private long reserveNo;
	private Date reserveDate;
	private String checkinDate;
	private String checkoutDate;
	private String reserveStatus;
	private String cancelReason;
	private String reviewStatus;
	private String path;
	private String request;	
	private int checkinTime;
	private int checkoutTime;
	private String payMethod;
	private int payAmount;

	
	
	public MemReserve() {}


	public MemReserve(int sitterNo, String sitterTitle, String memName, long reserveNo, 
			Date reserveDate,String checkinDate, String checkoutDate, String reserveStatus, 
			String cancelReason, String reviewStatus,String path) {
		super();
		this.sitterNo = sitterNo;
		this.sitterTitle = sitterTitle;
		this.memName = memName;
		this.reserveNo = reserveNo;
		this.reserveDate = reserveDate;
		this.checkinDate = checkinDate;
		this.checkoutDate = checkoutDate;
		this.reserveStatus = reserveStatus;
		this.cancelReason = cancelReason;
		this.reviewStatus = reviewStatus;
		this.path = path;
	}

	public MemReserve(int sitterNo, String memName, long reserveNo, String checkinDate,
			String checkoutDate, int checkinTime,int checkoutTime, Date reserveDate, String request, 
			String reserveStatus, String cancelReason, String payMethod, int payAmount) {
		super();
		this.sitterNo = sitterNo;
		this.memName = memName;
		this.reserveNo = reserveNo;
		this.checkinDate = checkinDate;
		this.checkoutDate = checkoutDate;
		this.checkinTime = checkinTime;
		this.checkoutTime = checkoutTime;
		this.reserveDate = reserveDate;
		this.request = request;
		this.reserveStatus = reserveStatus;
		this.cancelReason = cancelReason;
		this.payMethod = payMethod;
		this.payAmount = payAmount;
	}


	
	

	public int getSitterNo() {
		return sitterNo;
	}


	public String getSitterTitle() {
		return sitterTitle;
	}


	public String getMemName() {
		return memName;
	}


	public long getReserveNo() {
		return reserveNo;
	}


	public Date getReserveDate() {
		return reserveDate;
	}


	public String getCheckinDate() {
		return checkinDate;
	}


	public String getCheckoutDate() {
		return checkoutDate;
	}


	public String getReserveStatus() {
		return reserveStatus;
	}


	public String getCancelReason() {
		return cancelReason;
	}


	public String getReviewStatus() {
		return reviewStatus;
	}


	public String getPath() {
		return path;
	}


	public String getRequest() {
		return request;
	}


	public int getCheckinTime() {
		return checkinTime;
	}


	public int getCheckoutTime() {
		return checkoutTime;
	}


	public String getPayMethod() {
		return payMethod;
	}


	public int getPayAmount() {
		return payAmount;
	}


	public void setSitterNo(int sitterNo) {
		this.sitterNo = sitterNo;
	}


	public void setSitterTitle(String sitterTitle) {
		this.sitterTitle = sitterTitle;
	}


	public void setMemName(String memName) {
		this.memName = memName;
	}


	public void setReserveNo(long reserveNo) {
		this.reserveNo = reserveNo;
	}


	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}


	public void setCheckinDate(String checkinDate) {
		this.checkinDate = checkinDate;
	}


	public void setCheckoutDate(String checkoutDate) {
		this.checkoutDate = checkoutDate;
	}


	public void setReserveStatus(String reserveStatus) {
		this.reserveStatus = reserveStatus;
	}


	public void setCancelReason(String cancelReason) {
		this.cancelReason = cancelReason;
	}


	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}


	public void setPath(String path) {
		this.path = path;
	}


	public void setRequest(String request) {
		this.request = request;
	}


	public void setCheckinTime(int checkinTime) {
		this.checkinTime = checkinTime;
	}


	public void setCheckoutTime(int checkoutTime) {
		this.checkoutTime = checkoutTime;
	}


	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}


	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}


	@Override
	public String toString() {
		return "MemReserve [sitterNo=" + sitterNo + ", sitterTitle=" + sitterTitle + ", memName=" + memName
				+ ", reserveNo=" + reserveNo + ", reserveDate=" + reserveDate + ", checkinDate=" + checkinDate
				+ ", checkoutDate=" + checkoutDate + ", reserveStatus=" + reserveStatus + ", cancelReason="
				+ cancelReason + ", reviewStatus=" + reviewStatus + ", path=" + path + ", request=" + request
				+ ", checkinTime=" + checkinTime + ", checkoutTime=" + checkoutTime + ", payMethod=" + payMethod
				+ ", payAmount=" + payAmount + "]";
	}



	

}
