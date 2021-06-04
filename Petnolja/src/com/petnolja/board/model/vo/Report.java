package com.petnolja.board.model.vo;

import java.sql.Date;

public class Report {
	
	private int reportNo;
	private String title;	// 제목
	private String writerId; // 작성자
	private Date createdDate;
	private int reportSort;
	private int originNo;
	private String reporterId; // 신고자
	private Date reportedDate;
	private char done;
	private int memNo;
	private String content;

	public Report() {}

	public Report(int reportNo, String title, String writerId, Date createdDate, String reporterId, Date reportedDate) {
		super();
		this.reportNo = reportNo;
		this.title = title;
		this.writerId = writerId;
		this.createdDate = createdDate;
		this.reporterId = reporterId;
		this.reportedDate = reportedDate;
	}
	
	public Report(int reportNo, String title, String reporterId, String writerId, String content) {
		super();
		this.reportNo = reportNo;
		this.title = title;
		this.reporterId = reporterId;
		this.writerId = writerId;
		this.content = content;
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
	

	public Date getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}


	public String getReporterId() {
		return reporterId;
	}

	public void setReporterId(String reporterId) {
		this.reporterId = reporterId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", title=" + title + ", writerId=" + writerId + ", createdDate="
				+ createdDate + ", reportSort=" + reportSort + ", originNo=" + originNo + ", reporterId=" + reporterId
				+ ", reportedDate=" + reportedDate + ", done=" + done + ", memNo=" + memNo + ", content=" + content
				+ "]";
	}

	
}
