package com.petnolja.petsitter.model.vo;

import java.sql.Date;

public class Detail {
	
	private int petNo;
	private int memNo;
	private String resStatus;
	private long resNo;
    private String memName;
    private String memTel;
    private String resCheckin;
    private String resCheckout;
    private String petName;
    private String reQuest;
    
    public Detail() {}

	public Detail(int petNo, int memNo, String resStatus, long resNo, String memName, String memTel, String resCheckin,
			String resCheckout, String petName, String reQuest) {
		super();
		this.petNo = petNo;
		this.memNo = memNo;
		this.resStatus = resStatus;
		this.resNo = resNo;
		this.memName = memName;
		this.memTel = memTel;
		this.resCheckin = resCheckin;
		this.resCheckout = resCheckout;
		this.petName = petName;
		this.reQuest = reQuest;
	}

	public int getPetNo() {
		return petNo;
	}

	public void setPetNo(int petNo) {
		this.petNo = petNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getResStatus() {
		return resStatus;
	}

	public void setResStatus(String resStatus) {
		this.resStatus = resStatus;
	}

	public long getResNo() {
		return resNo;
	}

	public void setResNo(long resNo) {
		this.resNo = resNo;
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

	public String getResCheckin() {
		return resCheckin;
	}

	public void setResCheckin(String resCheckin) {
		this.resCheckin = resCheckin;
	}

	public String getResCheckout() {
		return resCheckout;
	}

	public void setResCheckout(String resCheckout) {
		this.resCheckout = resCheckout;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public String getReQuest() {
		return reQuest;
	}

	public void setReQuest(String reQuest) {
		this.reQuest = reQuest;
	}

	@Override
	public String toString() {
		return "Detail [petNo=" + petNo + ", memNo=" + memNo + ", resStatus=" + resStatus + ", resNo=" + resNo
				+ ", memName=" + memName + ", memTel=" + memTel + ", resCheckin=" + resCheckin + ", resCheckout="
				+ resCheckout + ", petName=" + petName + ", reQuest=" + reQuest + "]";
	}

}