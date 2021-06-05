package com.petnolja.board.model.vo;

import java.sql.Date;

public class MemNotice {
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeWriter;
	private String noticeCategory;
	private int count; // 조회수
	private Date createDate; // 작성일
	private String status;
	
	public MemNotice() {}

	public MemNotice(int noticeNo, String noticeTitle, String noticeContent, String noticeWriter, String noticeCategory,
			int count, Date createDate, String status) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
		this.noticeCategory = noticeCategory;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}

	
	public MemNotice(int noticeNo, String noticeTitle, String noticeWriter, int count, Date createDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.count = count;
		this.createDate = createDate;
	}

	
	
	
	
	public MemNotice(int noticeNo, String noticeCategory, String noticeTitle, String noticeContent) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeCategory = noticeCategory;
	}

	public MemNotice(int noticeNo, String noticeTitle, String noticeContent, String noticeWriter, Date createDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
		this.createDate = createDate;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public String getNoticeCategory() {
		return noticeCategory;
	}

	public int getCount() {
		return count;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public void setNoticeCategory(String noticeCategory) {
		this.noticeCategory = noticeCategory;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "MemNotice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeWriter=" + noticeWriter + ", noticeCategory=" + noticeCategory + ", count=" + count
				+ ", createDate=" + createDate + ", status=" + status + "]";
	}
	
	
	
	
}
