package com.petnolja.admin.model.vo;

import java.sql.Date;

public class Calculate {
	private String sitterId;
	private String sitterName;
	private String calYear;
	private String calMonth;
	private long payTotal;
	private String memName;
	private String memId;
	private String accBank;
	private String accNumber;
	private Date dealDate;
	private long payNo;
	private long payAmount;
	private char isPenalty;
	
	public Calculate() {}

	public Calculate(String sitterId, String sitterName, String calYear, String calMonth, long payTotal) {
		super();
		this.sitterId = sitterId;
		this.sitterName = sitterName;
		this.calYear = calYear;
		this.calMonth = calMonth;
		this.payTotal = payTotal;
	}
	

	public Calculate(String memName, String memId, String accBank, String accNumber, Date dealDate, long payNo,
			long payAmount, char isPenalty) {
		super();
		this.memName = memName;
		this.memId = memId;
		this.accBank = accBank;
		this.accNumber = accNumber;
		this.dealDate = dealDate;
		this.payNo = payNo;
		this.payAmount = payAmount;
		this.isPenalty = isPenalty;
	}

	/** 최서경
	 * 펫시터쪽 정산페이지에 사용
	 */
	public Calculate(String calYear, String calMonth, long payTotal) {
		super();
		this.calYear = calYear;
		this.calMonth = calMonth;
		this.payTotal = payTotal;
	}

	public String getSitterId() {
		return sitterId;
	}

	public void setSitterId(String sitterId) {
		this.sitterId = sitterId;
	}

	public String getSitterName() {
		return sitterName;
	}

	public void setSitterName(String sitterName) {
		this.sitterName = sitterName;
	}

	public String getCalYear() {
		return calYear;
	}

	public void setCalYear(String calYear) {
		this.calYear = calYear;
	}

	public String getCalMonth() {
		return calMonth;
	}

	public void setCalMonth(String calMonth) {
		this.calMonth = calMonth;
	}

	public long getPayTotal() {
		return payTotal;
	}

	public void setPayTotal(long payTotal) {
		this.payTotal = payTotal;
	}
	

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
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

	public Date getDealDate() {
		return dealDate;
	}

	public void setDealDate(Date dealDate) {
		this.dealDate = dealDate;
	}


	public long getPayNo() {
		return payNo;
	}

	public void setPayNo(long payNo) {
		this.payNo = payNo;
	}

	public long getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(long payAmount) {
		this.payAmount = payAmount;
	}

	public char getIsPenalty() {
		return isPenalty;
	}

	public void setIsPenalty(char isPenalty) {
		this.isPenalty = isPenalty;
	}

	@Override
	public String toString() {
		return "Calculate [sitterId=" + sitterId + ", sitterName=" + sitterName + ", calYear=" + calYear + ", calMonth="
				+ calMonth + ", payTotal=" + payTotal + ", memName=" + memName + ", memId=" + memId + ", accBank="
				+ accBank + ", accNumber=" + accNumber + ", dealDate=" + dealDate + ", payNo=" + payNo + ", payAmount="
				+ payAmount + ", isPenalty=" + isPenalty + "]";
	}


	

}
