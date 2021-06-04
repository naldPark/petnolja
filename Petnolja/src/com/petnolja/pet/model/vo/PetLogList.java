package com.petnolja.pet.model.vo;

import java.sql.Date;

public class PetLogList {
   
   private int memNo;
   private int sitterNo;
   private String sitterName;
   private int logNo;
   private long resNo;
   private Date logTime;
   private String logContent;
   private String path;
   
   public PetLogList() {}

   public PetLogList(int memNo, int sitterNo, String sitterName, int logNo, long resNo, Date logTime,
         String logContent, String path) {
      super();
      this.memNo = memNo;
      this.sitterNo = sitterNo;
      this.sitterName = sitterName;
      this.logNo = logNo;
      this.resNo = resNo;
      this.logTime = logTime;
      this.logContent = logContent;
      this.path = path;
   }

   public int getMemNo() {
      return memNo;
   }

   public int getSitterNo() {
      return sitterNo;
   }

   public String getSitterName() {
      return sitterName;
   }

   public int getLogNo() {
      return logNo;
   }

   public long getResNo() {
      return resNo;
   }

   public Date getLogTime() {
      return logTime;
   }

   public String getLogContent() {
      return logContent;
   }

   public String getPath() {
      return path;
   }

   public void setMemNo(int memNo) {
      this.memNo = memNo;
   }

   public void setSitterNo(int sitterNo) {
      this.sitterNo = sitterNo;
   }

   public void setSitterName(String sitterName) {
      this.sitterName = sitterName;
   }

   public void setLogNo(int logNo) {
      this.logNo = logNo;
   }

   public void setResNo(long resNo) {
      this.resNo = resNo;
   }

   public void setLogTime(Date logTime) {
      this.logTime = logTime;
   }

   public void setLogContent(String logContent) {
      this.logContent = logContent;
   }

   public void setPath(String path) {
      this.path = path;
   }

   @Override
   public String toString() {
      return "PetLogList [memNo=" + memNo + ", sitterNo=" + sitterNo + ", sitterName=" + sitterName + ", logNo="
            + logNo + ", resNo=" + resNo + ", logTime=" + logTime + ", logContent=" + logContent + ", path=" + path
            + "]";
   }


	
	
	
	
}
