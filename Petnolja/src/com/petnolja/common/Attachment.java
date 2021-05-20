package com.petnolja.common;

import java.sql.Date;

public class Attachment {
	
	private int fileNo; // SEQ 자동생성 번호
	private String category; //  사용하는곳(사용자문의,펫정보 등등 알아서 작명)
	private int atNo; // 참조하는 게시판의 PK(고유)번호  
	private String originName; //파일원본명
	private String changeName; //파일수정명
	private String filePath; //저장폴더경로
	private Date uploadDate; //업로드일
	private int fileLevel; //파일레벨 (파일이 여러개일경우 사용)
	private String status; //상태  기본 Y
	
	public Attachment() {}

	public Attachment(int fileNo, String category, int atNo, String originName, String changeName, String filePath,
			Date uploadDate, int fileLevel, String status) {
		super();
		this.fileNo = fileNo;
		this.category = category;
		this.atNo = atNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.status = status;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getAtNo() {
		return atNo;
	}

	public void setAtNo(int atNo) {
		this.atNo = atNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", category=" + category + ", atNo=" + atNo + ", originName="
				+ originName + ", changeName=" + changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate
				+ ", fileLevel=" + fileLevel + ", status=" + status + "]";
	}
		
	
	
}
