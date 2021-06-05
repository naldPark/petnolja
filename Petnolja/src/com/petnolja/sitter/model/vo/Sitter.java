package com.petnolja.sitter.model.vo;

import java.sql.Date;

public class Sitter{


	private int sitterNo;
	private String sitterAccess;
	private String petPeriod;
	private int petNo;
	private String license;
	private String experience;
	private String motive;
	private String addContent;
	private String promotionStatus;
	private Date promotionDate;
	private String stopReason;
	private String stopContent;
	private int penaltyCount;
	private String sitterTitle;
	private String sitterContent;
	private String additions;
	private String sitterCheckin;
	private String sitterCheckout;
	private String path;
	private String sitterName;
	private int avgReviewRating;
	
	
	public Sitter() {}
	

	public Sitter(int sitterNo, String sitterName, String sitterTitle, String path, int avgReviewRating) {
		super();
		this.sitterNo = sitterNo;
		this.sitterTitle = sitterTitle;
		this.path = path;
		this.sitterName = sitterName;
		this.avgReviewRating = avgReviewRating;
	}


	public Sitter(int sitterNo, String sitterTitle, String sitterName,String path) {
		super();
		this.sitterNo = sitterNo;
		this.sitterTitle = sitterTitle;
		this.sitterName = sitterName;
		this.path = path;
		
	}



	public Sitter(int sitterNo, String sitterAccess, String petPeriod, int petNo, String license, String experience,
			String motive, String addContent, String promotionStatus, Date promotionDate, String stopReason,
			String stopContent, int penaltyCount, String sitterTitle, String sitterContent, String additions,
			String sitterCheckin, String sitterCheckout) {
		super();
		this.sitterNo = sitterNo;
		this.sitterAccess = sitterAccess;
		this.petPeriod = petPeriod;
		this.petNo = petNo;
		this.license = license;
		this.experience = experience;
		this.motive = motive;
		this.addContent = addContent;
		this.promotionStatus = promotionStatus;
		this.promotionDate = promotionDate;
		this.stopReason = stopReason;
		this.stopContent = stopContent;
		this.penaltyCount = penaltyCount;
		this.sitterTitle = sitterTitle;
		this.sitterContent = sitterContent;
		this.additions = additions;
		this.sitterCheckin = sitterCheckin;
		this.sitterCheckout = sitterCheckout;
	}


	public int getSitterNo() {
		return sitterNo;
	}


	public void setSitterNo(int sitterNo) {
		this.sitterNo = sitterNo;
	}


	public String getSitterAccess() {
		return sitterAccess;
	}


	public void setSitterAccess(String sitterAccess) {
		this.sitterAccess = sitterAccess;
	}


	public String getPetPeriod() {
		return petPeriod;
	}


	public void setPetPeriod(String petPeriod) {
		this.petPeriod = petPeriod;
	}


	public int getPetNo() {
		return petNo;
	}


	public void setPetNo(int petNo) {
		this.petNo = petNo;
	}


	public String getLicense() {
		return license;
	}


	public void setLicense(String license) {
		this.license = license;
	}


	public String getExperience() {
		return experience;
	}


	public void setExperience(String experience) {
		this.experience = experience;
	}


	public String getMotive() {
		return motive;
	}


	public void setMotive(String motive) {
		this.motive = motive;
	}


	public String getAddContent() {
		return addContent;
	}


	public void setAddContent(String addContent) {
		this.addContent = addContent;
	}


	public String getPromotionStatus() {
		return promotionStatus;
	}


	public void setPromotionStatus(String promotionStatus) {
		this.promotionStatus = promotionStatus;
	}


	public Date getPromotionDate() {
		return promotionDate;
	}


	public void setPromotionDate(Date promotionDate) {
		this.promotionDate = promotionDate;
	}


	public String getStopReason() {
		return stopReason;
	}


	public void setStopReason(String stopReason) {
		this.stopReason = stopReason;
	}


	public String getStopContent() {
		return stopContent;
	}


	public void setStopContent(String stopContent) {
		this.stopContent = stopContent;
	}


	public int getPenaltyCount() {
		return penaltyCount;
	}


	public void setPenaltyCount(int penaltyCount) {
		this.penaltyCount = penaltyCount;
	}


	public String getSitterTitle() {
		return sitterTitle;
	}


	public void setSitterTitle(String sitterTitle) {
		this.sitterTitle = sitterTitle;
	}


	public String getSitterContent() {
		return sitterContent;
	}


	public void setSitterContent(String sitterContent) {
		this.sitterContent = sitterContent;
	}


	public String getAdditions() {
		return additions;
	}


	public void setAdditions(String additions) {
		this.additions = additions;
	}


	public String getSitterCheckin() {
		return sitterCheckin;
	}


	public void setSitterCheckin(String sitterCheckin) {
		this.sitterCheckin = sitterCheckin;
	}


	public String getSitterCheckout() {
		return sitterCheckout;
	}


	public void setSitterCheckout(String sitterCheckout) {
		this.sitterCheckout = sitterCheckout;
	}

	
	

	public String getPath() {
		return path;
	}




	public void setPath(String path) {
		this.path = path;
	}




	public String getSitterName() {
		return sitterName;
	}




	public void setSitterName(String sitterName) {
		this.sitterName = sitterName;
	}


	public int getAvgReviewRating() {
		return avgReviewRating;
	}


	public void setAvgReviewRating(int avgReviewRating) {
		this.avgReviewRating = avgReviewRating;
	}




	@Override
	public String toString() {
		return "Sitter [sitterNo=" + sitterNo + ", sitterAccess=" + sitterAccess + ", petPeriod=" + petPeriod
				+ ", petNo=" + petNo + ", license=" + license + ", experience=" + experience + ", motive=" + motive
				+ ", addContent=" + addContent + ", promotionStatus=" + promotionStatus + ", promotionDate="
				+ promotionDate + ", stopReason=" + stopReason + ", stopContent=" + stopContent + ", penaltyCount="
				+ penaltyCount + ", sitterTitle=" + sitterTitle + ", sitterContent=" + sitterContent + ", additions="
				+ additions + ", sitterCheckin=" + sitterCheckin + ", sitterCheckout=" + sitterCheckout + "]";
	}
	
	
	
	
	
	
}
