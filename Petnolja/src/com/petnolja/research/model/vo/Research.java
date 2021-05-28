package com.petnolja.research.model.vo;

public class Research {

	
	private int sitterNo;
	private String sitterName;
	private String sitterTitle;
	private String addContent;
	private String onenightFee;
	private String dayFee;
	private int avgRating;
	private String path;
	private int dateCount; //검색기간 중 이용가능한 일자입니다
	private Double distance;
	
	public Research() {}

	public Research(int sitterNo, String sitterName, String sitterTitle, String addContent, String onenightFee,
			String dayFee, int avgRating, String path, int dateCount, Double distance) {
		super();
		this.sitterNo = sitterNo;
		this.sitterName = sitterName;
		this.sitterTitle = sitterTitle;
		this.addContent = addContent;
		this.onenightFee = onenightFee;
		this.dayFee = dayFee;
		this.avgRating = avgRating;
		this.path = path;
		this.dateCount = dateCount;
		this.distance = distance;
	}

	public int getSitterNo() {
		return sitterNo;
	}

	public void setSitterNo(int sitterNo) {
		this.sitterNo = sitterNo;
	}

	public String getSitterName() {
		return sitterName;
	}

	public void setSitterName(String sitterName) {
		this.sitterName = sitterName;
	}

	public String getSitterTitle() {
		return sitterTitle;
	}

	public void setSitterTitle(String sitterTitle) {
		this.sitterTitle = sitterTitle;
	}

	public String getAddContent() {
		return addContent;
	}

	public void setAddContent(String addContent) {
		this.addContent = addContent;
	}

	public String getOnenightFee() {
		return onenightFee;
	}

	public void setOnenightFee(String onenightFee) {
		this.onenightFee = onenightFee;
	}

	public String getDayFee() {
		return dayFee;
	}

	public void setDayFee(String dayFee) {
		this.dayFee = dayFee;
	}

	public int getAvgRating() {
		return avgRating;
	}

	public void setAvgRating(int avgRating) {
		this.avgRating = avgRating;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getDateCount() {
		return dateCount;
	}

	public void setDateCount(int dateCount) {
		this.dateCount = dateCount;
	}

	public Double getDistance() {
		return distance;
	}

	public void setDistance(Double distance) {
		this.distance = distance;
	}
		

	@Override
	public String toString() {
		return "Research [sitterNo=" + sitterNo + ", sitterName=" + sitterName + ", sitterTitle=" + sitterTitle
				+ ", addContent=" + addContent + ", onenightFee=" + onenightFee + ", dayFee=" + dayFee + ", avgRating="
				+ avgRating + ", path=" + path + ", dateCount=" + dateCount + ", distance=" + distance + "]";
	}

	
	
	
}
