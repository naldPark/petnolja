package com.petnolja.petsitter.model.vo;

import java.sql.Date;

public class Reserv {
	
	private int memNo;
	private String resStatus;
    private String memName;
    private String memTel;
    private long resNo;
    private String resCheckin;
    private String resCheckout;
    private String reQuest;
    
    public Reserv() {}

	

	public Reserv(int memNo, String resStatus, String memName, String memTel, long resNo, String resCheckin,
			String resCheckout, String reQuest) {
		super();
		this.memNo = memNo;
		this.resStatus = resStatus;
		this.memName = memName;
		this.memTel = memTel;
		this.resNo = resNo;
		this.resCheckin = resCheckin;
		this.resCheckout = resCheckout;
		this.reQuest = reQuest;
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

	public long getResNo() {
		return resNo;
	}

	public void setResNo(long resNo) {
		this.resNo = resNo;
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

	public String getReQuest() {
		return reQuest;
	}

	public void setReQuest(String reQuest) {
		this.reQuest = reQuest;
	}

	@Override
	public String toString() {
		return "Reserv [memNo=" + memNo + ", resStatus=" + resStatus + ", memName=" + memName + ", memTel=" + memTel
				+ ", resNo=" + resNo + ", resCheckin=" + resCheckin + ", resCheckout=" + resCheckout + ", reQuest="
				+ reQuest + "]";
	}
    

}
