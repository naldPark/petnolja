package com.petnolja.research.model.vo;

import java.sql.Date;

public class Review{
	

	private int reserveNo;
	private int memNo;
	private int sitterNo;
	private int reviewNo;
	private int reviewRating;
	private String reviewContent;
	private Date reviewDate;
	private String reviewReplyContent;
	private Date reviewReplyTime;
	private String memName;
	private String path;
	
	public Review() {}

	public Review(int reserveNo, int memNo, int sitterNo, int reviewNo, int reviewRating, String reviewContent,
			Date reviewDate, String reviewReplyContent, Date reviewReplyTime, String memName, String path) {
		super();
		this.reserveNo = reserveNo;
		this.memNo = memNo;
		this.sitterNo = sitterNo;
		this.reviewNo = reviewNo;
		this.reviewRating = reviewRating;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.reviewReplyContent = reviewReplyContent;
		this.reviewReplyTime = reviewReplyTime;
		this.memName = memName;
		this.path = path;
	}
	
	

	public Review(String memName, int reviewRating, String reviewContent, String path) {
		super();
		this.reviewRating = reviewRating;
		this.reviewContent = reviewContent;
		this.memName = memName;
		this.path = path;
	}

	public int getReserveNo() {
		return reserveNo;
	}

	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getSitterNo() {
		return sitterNo;
	}

	public void setSitterNo(int sitterNo) {
		this.sitterNo = sitterNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getReviewRating() {
		return reviewRating;
	}

	public void setReviewRating(int reviewRating) {
		this.reviewRating = reviewRating;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReviewReplyContent() {
		return reviewReplyContent;
	}

	public void setReviewReplyContent(String reviewReplyContent) {
		this.reviewReplyContent = reviewReplyContent;
	}

	public Date getReviewReplyTime() {
		return reviewReplyTime;
	}

	public void setReviewReplyTime(Date reviewReplyTime) {
		this.reviewReplyTime = reviewReplyTime;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Override
	public String toString() {
		return "Review [reserveNo=" + reserveNo + ", memNo=" + memNo + ", sitterNo=" + sitterNo + ", reviewNo="
				+ reviewNo + ", reviewRating=" + reviewRating + ", reviewContent=" + reviewContent + ", reviewDate="
				+ reviewDate + ", reviewReplyContent=" + reviewReplyContent + ", reviewReplyTime=" + reviewReplyTime
				+ ", memName=" + memName + ", path=" + path + "]";
	}
	


}
