package com.petnolja.pet.model.vo;

import java.sql.Date;

public class Log {
   
	private int memNo;
   private int logNo;
   private String resDate;
   private Date logTime;
   private long resNo;
   private String logContent;
   private String path;
   
   public Log() {}







public Log(int logNo, String resDate, Date logTime, long resNo) {
	super();
	this.logNo = logNo;
	this.resDate = resDate;
	this.logTime = logTime;
	this.resNo = resNo;
}




public int getMemNo() {
	return memNo;
}

public void setMemNo(int memNo) {
	this.memNo = memNo;
}

public int getLogNo() {
	return logNo;
}

public void setLogNo(int logNo) {
	this.logNo = logNo;
}

public long getResNo() {
	return resNo;
}

public void setResNo(long resNo) {
	this.resNo = resNo;
}

public Date getLogTime() {
	return logTime;
}

public void setLogTime(Date logTime) {
	this.logTime = logTime;
}

public String getResDate() {
	return resDate;
}

public void setResDate(String resDate) {
	this.resDate = resDate;
}

public String getLogContent() {
	return logContent;
}

public void setLogContent(String logContent) {
	this.logContent = logContent;
}

public String getPath() {
	return path;
}

public void setPath(String path) {
	this.path = path;
}

@Override
public String toString() {
	return "Log [memNo=" + memNo + ", logNo=" + logNo + ", resNo=" + resNo + ", logTime=" + logTime + ", resDate="
			+ resDate + ", logContent=" + logContent + ", path=" + path + "]";
}






   
	
}
