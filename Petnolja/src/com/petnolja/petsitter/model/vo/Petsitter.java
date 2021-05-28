package com.petnolja.petsitter.model.vo;

import java.sql.Date;

public class Petsitter {
	
	private String memID; // 회원 아이디
	private int sitterNo; // 펫시터 번호
	private char access; // 권한
	private String petPeriod; // 시팅 해온 기간
	private String petNo; // 펫 수
	private String license; // 자격증 보유
	private String experience; // 경험기간
	private String motive; // 
	private char pStatus; // 승인 여부
	private Date pDate; // 승인일
	private String stopReason; // 중지사유
	private String stopContent; // 중시 상세 사유
	private int penaltyCount; // 패널티 누적 횟수
	private String additions; // 추가서비스
	
	public Petsitter() {}
	
	public Petsitter(String memID, int sitterNo, char access, String petPeriod, String petNo, String license,
			String experience, String motive, char pStatus, Date pDate, String stopReason, String stopContent,
			int penaltyCount, String additions) {
		super();
		this.memID = memID;
		this.sitterNo = sitterNo;
		this.access = access;
		this.petPeriod = petPeriod;
		this.petNo = petNo;
		this.license = license;
		this.experience = experience;
		this.motive = motive;
		this.pStatus = pStatus;
		this.pDate = pDate;
		this.stopReason = stopReason;
		this.stopContent = stopContent;
		this.penaltyCount = penaltyCount;
		this.additions = additions;
	}
	
	public Petsitter(String memID, int sitterNo, char access, String petPeriod, String petNo, String license,
			String experience, String motive, char pStatus, Date pDate, String additions) {
		super();
		this.memID = memID;
		this.sitterNo = sitterNo;
		this.access = access;
		this.petPeriod = petPeriod;
		this.petNo = petNo;
		this.license = license;
		this.experience = experience;
		this.motive = motive;
		this.pStatus = pStatus;
		this.pDate = pDate;
		this.additions = additions;
	}

	public String getMemID() {
		return memID;
	}

	public void setMemID(String memID) {
		this.memID = memID;
	}

	public int getSitterNo() {
		return sitterNo;
	}

	public void setSitterNo(int sitterNo) {
		this.sitterNo = sitterNo;
	}

	public char getAccess() {
		return access;
	}

	public void setAccess(char access) {
		this.access = access;
	}

	public String getPetPeriod() {
		return petPeriod;
	}

	public void setPetPeriod(String petPeriod) {
		this.petPeriod = petPeriod;
	}

	public String getPetNo() {
		return petNo;
	}

	public void setPetNo(String petNo) {
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

	public char getpStatus() {
		return pStatus;
	}

	public void setpStatus(char pStatus) {
		this.pStatus = pStatus;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
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

	public String getAdditions() {
		return additions;
	}

	public void setAdditions(String additions) {
		this.additions = additions;
	}

	@Override
	public String toString() {
		return "PetsitterList [memID=" + memID + ", sitterNo=" + sitterNo + ", access=" + access
				+ ", petPeriod=" + petPeriod + ", petNo=" + petNo + ", license=" + license + ", experience="
				+ experience + ", motive=" + motive + ", pStatus=" + pStatus + ", pDate=" + pDate + ", stopReason="
				+ stopReason + ", stopContent=" + stopContent + ", penaltyCount=" + penaltyCount + ", additions="
				+ additions + "]";
	}

	
	
	
}
