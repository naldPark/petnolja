package com.petnolja.memboard.model.vo;

import java.sql.Date;

public class MemBoard {
	//qna에있는거 같이 씁시다
	
	//qna에있는거 같이 씁시다
	
		private int qnaNo;
		private int qMemNo;
		private int aSitterNo;
		private String memName;
		private String qTitle;
		private String qSecret;
		private Date qCreateDate;
		
		public MemBoard() {}

		public MemBoard(int qnaNo, int qMemNo, int aSitterNo, String memName, String qTitle, String qSecret,
				Date qCreateDate) {
			super();
			this.qnaNo = qnaNo;
			this.qMemNo = qMemNo;
			this.aSitterNo = aSitterNo;
			this.memName = memName;
			this.qTitle = qTitle;
			this.qSecret = qSecret;
			this.qCreateDate = qCreateDate;
		}

		public int getQnaNo() {
			return qnaNo;
		}

		public int getqMemNo() {
			return qMemNo;
		}

		public int getaSitterNo() {
			return aSitterNo;
		}

		public String getMemName() {
			return memName;
		}

		public String getqTitle() {
			return qTitle;
		}

		public String getqSecret() {
			return qSecret;
		}

		public Date getqCreateDate() {
			return qCreateDate;
		}

		public void setQnaNo(int qnaNo) {
			this.qnaNo = qnaNo;
		}

		public void setqMemNo(int qMemNo) {
			this.qMemNo = qMemNo;
		}

		public void setaSitterNo(int aSitterNo) {
			this.aSitterNo = aSitterNo;
		}

		public void setMemName(String memName) {
			this.memName = memName;
		}

		public void setqTitle(String qTitle) {
			this.qTitle = qTitle;
		}

		public void setqSecret(String qSecret) {
			this.qSecret = qSecret;
		}

		public void setqCreateDate(Date qCreateDate) {
			this.qCreateDate = qCreateDate;
		}

		@Override
		public String toString() {
			return "MemBoard [qnaNo=" + qnaNo + ", qMemNo=" + qMemNo + ", aSitterNo=" + aSitterNo + ", memName=" + memName
					+ ", qTitle=" + qTitle + ", qSecret=" + qSecret + ", qCreateDate=" + qCreateDate + "]";
		}
		
		
		
		
	}