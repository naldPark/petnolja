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
	private String motive; // 지원동기
	private String addContent; // 하고싶은말
	private char pStatus; // 승인 여부
	private Date pDate; // 승인일
	private String stopReason; // 중지사유
	private String stopContent; // 중시 상세 사유
	private int penaltyCount; // 패널티 누적 횟수
	private String sitterTitle; // 시터 제목
	private String sitterContent; // 시터 내용
	private String sitterCkIn; // 체크인
	private String sitterCkOut; // 체크아웃
	private String additions; // 추가서비스
	private int duration;
	private int qnaNo; //qna 넘버
	private String qTitle; //qna 제목
	private String aWriter; 
	private Date qCtrateDate;
	
	public Petsitter() {}
	
	public Petsitter(String memID, int sitterNo, char access, String petPeriod, String petNo, String license,
			String experience, String motive, char pStatus, Date pDate, String stopReason, String stopContent,
			int penaltyCount, String additions, int duration, int qnaNo ,String qTitle , String aWriter ,Date qCtrateDate) {
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
		this.duration = duration;
		this.qnaNo = qnaNo;
	}
	

	public Petsitter(String memID, int sitterNo, char access, String petPeriod, String petNo, String license,
			String experience, String motive, String addContent, char pStatus, Date pDate, String stopReason,
			String stopContent, int penaltyCount, String sitterTitle, String sitterContent, String sitterCkIn,
			String sitterCkOut, String additions, int duration, int qnaNo, String qTitle, String aWriter,
			Date qCtrateDate) {
		super();
		this.memID = memID;
		this.sitterNo = sitterNo;
		this.access = access;
		this.petPeriod = petPeriod;
		this.petNo = petNo;
		this.license = license;
		this.experience = experience;
		this.motive = motive;
		this.addContent = addContent;
		this.pStatus = pStatus;
		this.pDate = pDate;
		this.stopReason = stopReason;
		this.stopContent = stopContent;
		this.penaltyCount = penaltyCount;
		this.sitterTitle = sitterTitle;
		this.sitterContent = sitterContent;
		this.sitterCkIn = sitterCkIn;
		this.sitterCkOut = sitterCkOut;
		this.additions = additions;
		this.duration = duration;
		this.qnaNo = qnaNo;
		this.qTitle = qTitle;
		this.aWriter = aWriter;
		this.qCtrateDate = qCtrateDate;
	}

	public Petsitter(String memID, int sitterNo, char access, String petPeriod, String petNo, String license,
			String experience, char pStatus, Date pDate, String additions) {
		super();
		this.memID = memID;
		this.sitterNo = sitterNo;
		this.access = access;
		this.petPeriod = petPeriod;
		this.petNo = petNo;
		this.license = license;
		this.experience = experience;
		this.pStatus = pStatus;
		this.pDate = pDate;
		this.additions = additions;
	}

	public Petsitter(int sitterNo, String memID, String petPeriod, String petNo, String license, String experience,
			String motive, String addContent, String additions) {
		super();
		this.sitterNo = sitterNo;
		this.memID = memID;
		this.petPeriod = petPeriod;
		this.petNo = petNo;
		this.license = license;
		this.experience = experience;
		this.motive = motive;
		this.addContent = addContent;
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

	public String getAddContent() {
		return addContent;
	}

	public void setAddContent(String addContent) {
		this.addContent = addContent;
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

	public String getSitterCkIn() {
		return sitterCkIn;
	}

	public void setSitterCkIn(String sitterCkIn) {
		this.sitterCkIn = sitterCkIn;
	}

	public String getSitterCkOut() {
		return sitterCkOut;
	}

	public void setSitterCkOut(String sitterCkOut) {
		this.sitterCkOut = sitterCkOut;
	}

	public String getAdditions() {
		return additions;
	}

	public void setAdditions(String additions) {
		this.additions = additions;
	}
	

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}
	
	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getaWriter() {
		return aWriter;
	}

	public void setaWriter(String aWriter) {
		this.aWriter = aWriter;
	}

	public Date getqCtrateDate() {
		return qCtrateDate;
	}

	public void setqCtrateDate(Date qCtrateDate) {
		this.qCtrateDate = qCtrateDate;
	}

	@Override
	public String toString() {
		return "Petsitter [memID=" + memID + ", sitterNo=" + sitterNo + ", access=" + access + ", petPeriod="
				+ petPeriod + ", petNo=" + petNo + ", license=" + license + ", experience=" + experience + ", motive="
				+ motive + ", addContent=" + addContent + ", pStatus=" + pStatus + ", pDate=" + pDate + ", stopReason="
				+ stopReason + ", stopContent=" + stopContent + ", penaltyCount=" + penaltyCount + ", sitterTitle="
				+ sitterTitle + ", sitterContent=" + sitterContent + ", sitterCkIn=" + sitterCkIn + ", sitterCkOut="
				+ sitterCkOut + ", additions=" + additions + ", duration=" + duration + ", qnaNo=" + qnaNo + ", qTitle="
				+ qTitle + ", aWriter=" + aWriter + ", qCtrateDate=" + qCtrateDate + "]";
	}

}
