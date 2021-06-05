package com.petnolja.qna.model.vo;

import java.util.Date;


public class Qna {
	
	private int qnaNo;
	private String qMemNo;
	private String aSitterNo;	// 펫시터에게 문의 시 어느 펫시터에게 문의하는 것인지 펫시터 번호
	private int qSort;			// 1이면 관리자에게 질문, 2이면 펫시터에게 질문
	private String qCategory;	// 관리자에게 문의 시 회원정보, 결제/환불/취소, 이용관련, 기타 중 선택
	private String qTitle;
	private String qContent;
	private Date qCreateDate;
	private String aContent;
	private String aWriter;		// 관리자가 답변 시 관리자 번호
	private Date aCreateDate;
	private String qnaStatus;
	private String qSecret;
	private String memName;
	private int rowNum;  // SORT한 글번호 다시 매김
	
	
	public Qna() {}

	public Qna(int qnaNo, String qMemNo, String aSitterNo, int qSort, String qCategory, String qTitle, String qContent,
			Date qCreateDate, String aContent, String aWriter, Date aCreateDate, String qnaStatus, String qSecret) {
		super();
		this.qnaNo = qnaNo;
		this.qMemNo = qMemNo;
		this.aSitterNo = aSitterNo;
		this.qSort = qSort;
		this.qCategory = qCategory;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qCreateDate = qCreateDate;
		this.aContent = aContent;
		this.aWriter = aWriter;
		this.aCreateDate = aCreateDate;
		this.qnaStatus = qnaStatus;
		this.qSecret = qSecret;
	}

	/** 최서경
	 * 관리자 qna조회용으로 사용
	 */
	public Qna(int qnaNo, String qMemNo, String qCategory, String qTitle, Date qCreateDate, String aContent,
			String aWriter) {
		super();
		this.qnaNo = qnaNo;
		this.qMemNo = qMemNo;
		this.qCategory = qCategory;
		this.qTitle = qTitle;
		this.qCreateDate = qCreateDate;
		this.aContent = aContent;
		this.aWriter = aWriter;
	}
	
	/** 최서경
	 * qna 상세조회 및 답변 작성 화면
	 */
	public Qna(int qnaNo, String qMemNo, String qTitle, String qContent, String aContent, String aWriter) {
		super();
		this.qnaNo = qnaNo;
		this.qMemNo = qMemNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.aContent = aContent;
		this.aWriter = aWriter;
	}
	
	/** 날드
	 * qna 유저입장에서 관리자 1:1문의 리스트
	 */
	public Qna(int rowNum, int qnaNo, String qMemNo, String memName, String qCategory, String qTitle, Date qCreateDate) {
		super();
		this.rowNum = rowNum;
		this.qnaNo = qnaNo;
		this.qMemNo = qMemNo;
		this.qCategory = qCategory;
		this.qTitle = qTitle;
		this.qCreateDate = qCreateDate;
		this.memName = memName;
	}
	
	
	/** 날드
	 * qna 유저입장에서 관리자 1:1문의 특정 글 조회
	 */
	public Qna(int qnaNo, String qMemNo, String qCategory, String memName, String qTitle, String qContent, String aContent,
			Date aCreateDate) {
		super();
		this.qnaNo = qnaNo;
		this.qMemNo = qMemNo;
		this.qCategory = qCategory;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.aContent = aContent;
		this.aCreateDate = aCreateDate;
		this.memName = memName;
	}

	
	
	public int getQnaNo() {
		return qnaNo;
	}


	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getqMemNo() {
		return qMemNo;
	}

	public void setqMemNo(String qMemNo) {
		this.qMemNo = qMemNo;
	}

	public String getaSitterNo() {
		return aSitterNo;
	}

	public void setaSitterNo(String aSitterNo) {
		this.aSitterNo = aSitterNo;
	}

	public int getqSort() {
		return qSort;
	}

	public void setqSort(int qSort) {
		this.qSort = qSort;
	}

	public String getqCategory() {
		return qCategory;
	}

	public void setqCategory(String qCategory) {
		this.qCategory = qCategory;
	}
	

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public Date getqCreateDate() {
		return qCreateDate;
	}

	public void setqCreateDate(Date qCreateDate) {
		this.qCreateDate = qCreateDate;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public String getaWriter() {
		return aWriter;
	}

	public void setaWriter(String aWriter) {
		this.aWriter = aWriter;
	}

	public Date getaCreateDate() {
		return aCreateDate;
	}

	public void setaCreateDate(Date aCreateDate) {
		this.aCreateDate = aCreateDate;
	}

	public String getQnaStatus() {
		return qnaStatus;
	}

	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}

	public String getqSecret() {
		return qSecret;
	}

	public void setqSecret(String qSecret) {
		this.qSecret = qSecret;
	}
	
	
	

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}
	

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", qMemNo=" + qMemNo + ", aSitterNo=" + aSitterNo + ", qSort=" + qSort
				+ ", qCategory=" + qCategory + ", qTitle=" + qTitle + ", qContent=" + qContent + ", qCreateDate="
				+ qCreateDate + ", aContent=" + aContent + ", aWriter=" + aWriter + ", aCreateDate=" + aCreateDate
				+ ", qnaStatus=" + qnaStatus + ", qSecret=" + qSecret + "]";
	}
	
	

	
	
	
}

