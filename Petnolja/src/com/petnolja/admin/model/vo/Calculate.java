package com.petnolja.admin.model.vo;

public class Calculate {
	private String sitterId;
	private String sitterName;
	private String calYear;
	private String calMonth;
	private long payTotal;
	
	public Calculate() {}

	public Calculate(String sitterId, String sitterName, String calYear, String calMonth, long payTotal) {
		super();
		this.sitterId = sitterId;
		this.sitterName = sitterName;
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

	@Override
	public String toString() {
		return "Calculate [sitterId=" + sitterId + ", sitterName=" + sitterName + ", calYear=" + calYear + ", calMonth="
				+ calMonth + ", payTotal=" + payTotal + "]";
	}


	

}
