package com.petnolja.board.model.vo;

import java.sql.Date;

public class Report {
	
	private int reportNo;
	private String title;	// 제목
	private String writerId; // 작성자
	private int reportSort;
	private int originNo;
	private Date reportedDate;
	private char done;
	private int memNo;
	private String reporterId; // 신고자

	public Report() {}
	
	

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
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getReporterId() {
		return reporterId;
	}

	public void setReporterId(String reporterId) {
		this.reporterId = reporterId;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportSort=" + reportSort + ", originNo=" + originNo
				+ ", reportedDate=" + reportedDate + ", done=" + done + ", memNo=" + memNo + ", title=" + title
				+ ", writerId=" + writerId + ", reporterId=" + reporterId + "]";
	}

	
}
