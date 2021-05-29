package com.petnolja.memreserve.vo;

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
	
	
	public MemReserve() {}


	public MemReserve(int sitterNo, String sitterTitle, String memName, long reserveNo, Date reserveDate,
			String checkinDate, String checkoutDate, String reserveStatus, String cancelReason, String reviewStatus,
			String path) {
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


	public int getSitterNo() {
		return sitterNo;
	}


	public void setSitterNo(int sitterNo) {
		this.sitterNo = sitterNo;
	}


	public String getSitterTitle() {
		return sitterTitle;
	}


	public void setSitterTitle(String sitterTitle) {
		this.sitterTitle = sitterTitle;
	}


	public String getMemName() {
		return memName;
	}


	public void setMemName(String memName) {
		this.memName = memName;
	}


	public long getReserveNo() {
		return reserveNo;
	}


	public void setReserveNo(long reserveNo) {
		this.reserveNo = reserveNo;
	}


	public Date getReserveDate() {
		return reserveDate;
	}


	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}


	public String getCheckinDate() {
		return checkinDate;
	}


	public void setCheckinDate(String checkinDate) {
		this.checkinDate = checkinDate;
	}


	public String getCheckoutDate() {
		return checkoutDate;
	}


	public void setCheckoutDate(String checkoutDate) {
		this.checkoutDate = checkoutDate;
	}


	public String getReserveStatus() {
		return reserveStatus;
	}


	public void setReserveStatus(String reserveStatus) {
		this.reserveStatus = reserveStatus;
	}


	public String getCancelReason() {
		return cancelReason;
	}


	public void setCancelReason(String cancelReason) {
		this.cancelReason = cancelReason;
	}


	public String getReviewStatus() {
		return reviewStatus;
	}


	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}


	public String getPath() {
		return path;
	}


	public void setPath(String path) {
		this.path = path;
	}


	@Override
	public String toString() {
		return "MemReserve [sitterNo=" + sitterNo + ", sitterTitle=" + sitterTitle + ", memName=" + memName
				+ ", reserveNo=" + reserveNo + ", reserveDate=" + reserveDate + ", checkinDate=" + checkinDate
				+ ", checkoutDate=" + checkoutDate + ", reserveStatus=" + reserveStatus + ", cancelReason="
				+ cancelReason + ", reviewStatus=" + reviewStatus + ", path=" + path + "]";
	}

	

}
