package com.petnolja.petsitter.model.vo;

import java.sql.Date;

public class PetsitterReview {
	
	private int sitterNo;
	private long resNo;
	private Date resDate;
	private String checkIn;
	private String checkOut;
	private String memName;
	private int revNo;
	private int revRating;
	private String status;
	private String content;
	
	public PetsitterReview() {}

	public PetsitterReview(int sitterNo, long resNo, Date resDate, String checkIn, String checkOut, String memName,
			int revNo, int revRating, String status, String content) {
		super();
		this.sitterNo = sitterNo;
		this.resNo = resNo;
		this.resDate = resDate;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.memName = memName;
		this.revNo = revNo;
		this.revRating = revRating;
		this.status = status;
		this.content = content;
	}

	public int getSitterNo() {
		return sitterNo;
	}

	public long getResNo() {
		return resNo;
	}

	public Date getResDate() {
		return resDate;
	}

	public String getCheckIn() {
		return checkIn;
	}

	public String getCheckOut() {
		return checkOut;
	}

	public String getMemName() {
		return memName;
	}

	public int getRevNo() {
		return revNo;
	}

	public int getRevRating() {
		return revRating;
	}

	public String getStatus() {
		return status;
	}

	public String getContent() {
		return content;
	}

	public void setSitterNo(int sitterNo) {
		this.sitterNo = sitterNo;
	}

	public void setResNo(long resNo) {
		this.resNo = resNo;
	}

	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}

	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}

	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}

	public void setRevRating(int revRating) {
		this.revRating = revRating;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "PetsitterReview [sitterNo=" + sitterNo + ", resNo=" + resNo + ", resDate=" + resDate + ", checkIn="
				+ checkIn + ", checkOut=" + checkOut + ", memName=" + memName + ", revNo=" + revNo + ", revRating="
				+ revRating + ", status=" + status + ", content=" + content + "]";
	}

	
	
}
