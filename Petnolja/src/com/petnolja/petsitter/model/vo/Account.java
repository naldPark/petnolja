package com.petnolja.petsitter.model.vo;

public class Account {
	
	private int accNo;
	private int sitterNo;
	private String accStatus;
	private String accBank;
	private String accNumber;
	private String accRepresent;
	
	public Account() {}

	public Account(int accNo, int sitterNo, String accStatus, String accBank, String accNumber, String accRepresent) {
		super();
		this.accNo = accNo;
		this.sitterNo = sitterNo;
		this.accStatus = accStatus;
		this.accBank = accBank;
		this.accNumber = accNumber;
		this.accRepresent = accRepresent;
	}
	

	/** 최서경
	 * 펫시터 계좌 목록 조회용
	 */
	public int getAccNo() {
		return accNo;
	}

	public Account(int accNo, String accBank, String accNumber, String accRepresent) {
		super();
		this.accNo = accNo;
		this.accBank = accBank;
		this.accNumber = accNumber;
		this.accRepresent = accRepresent;
	}

	public void setAccNo(int accNo) {
		this.accNo = accNo;
	}

	public int getSitterNo() {
		return sitterNo;
	}

	public void setSitterNo(int sitterNo) {
		this.sitterNo = sitterNo;
	}

	public String getAccStatus() {
		return accStatus;
	}

	public void setAccStatus(String accStatus) {
		this.accStatus = accStatus;
	}

	public String getAccBank() {
		return accBank;
	}

	public void setAccBank(String accBank) {
		this.accBank = accBank;
	}

	public String getAccNumber() {
		return accNumber;
	}

	public void setAccNumber(String accNumber) {
		this.accNumber = accNumber;
	}

	public String getAccRepresent() {
		return accRepresent;
	}

	public void setAccRepresent(String accRepresent) {
		this.accRepresent = accRepresent;
	}

	@Override
	public String toString() {
		return "Account [accNo=" + accNo + ", sitterNo=" + sitterNo + ", accStatus=" + accStatus + ", accBank="
				+ accBank + ", accNumber=" + accNumber + ", accRepresent=" + accRepresent + "]";
	};
	
	

}
