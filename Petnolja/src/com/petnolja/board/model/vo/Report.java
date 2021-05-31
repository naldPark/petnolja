package com.petnolja.board.model.vo;

import java.sql.Date;

public class Report {
	
	private int reportNo;
	private int reportSort;
	private int originNo;
	private Date reportedDate;
	private char done;
	private int memNo;
	
	public Report() {}
	
	public Report(int reportNo, int reportSort, int originNo, Date reportedDate, char done, int memNo) {
		super();
		this.reportNo = reportNo;
		this.reportSort = reportSort;
		this.originNo = originNo;
		this.reportedDate = reportedDate;
		this.done = done;
		this.memNo = memNo;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getReportSort() {
		return reportSort;
	}

	public void setReportSort(int reportSort) {
		this.reportSort = reportSort;
	}

	public int getOriginNo() {
		return originNo;
	}

	public void setOriginNo(int originNo) {
		this.originNo = originNo;
	}

	public Date getReportedDate() {
		return reportedDate;
	}

	public void setReportedDate(Date reportedDate) {
		this.reportedDate = reportedDate;
	}

	public char getDone() {
		return done;
	}

	public void setDone(char done) {
		this.done = done;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportSort=" + reportSort + ", originNo=" + originNo
				+ ", reportedDate=" + reportedDate + ", done=" + done + ", memNo=" + memNo + "]";
	}
	
	
	
}
