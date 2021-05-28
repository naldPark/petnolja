package com.petnolja.research.model.vo;

public class Research {


	private int sitterNo;
	private String sitterName;
	private String address;
	private String license;
	private String sitterTitle;
	private String sitterContent;
	private String additions;
	private String smallNightFee;
	private String midNightFee;
	private String bigNightFee;
	private String smallDayFee;
	private String midDayFee;
	private String bigDayFee;
	private int avgRating;
	private int checkin;
	private int checkout;	
	private String ableDate;
	private String path;
	private int dateCount; //검색기간 중 이용가능한 일자입니다
	private Double distance;
	
	public Research() {}

	public Research(int sitterNo, String sitterName, String address, String license, String sitterTitle,
			String sitterContent, String additions, String smallNightFee, String midNightFee, String bigNightFee,
			String smallDayFee, String midDayFee, String bigDayFee, int avgRating, int checkin, int checkout,
			String ableDate, String path, int dateCount, Double distance) {
		super();
		this.sitterNo = sitterNo;
		this.sitterName = sitterName;
		this.address = address;
		this.license = license;
		this.sitterTitle = sitterTitle;
		this.sitterContent = sitterContent;
		this.additions = additions;
		this.smallNightFee = smallNightFee;
		this.midNightFee = midNightFee;
		this.bigNightFee = bigNightFee;
		this.smallDayFee = smallDayFee;
		this.midDayFee = midDayFee;
		this.bigDayFee = bigDayFee;
		this.avgRating = avgRating;
		this.checkin = checkin;
		this.checkout = checkout;
		this.ableDate = ableDate;
		this.path = path;
		this.dateCount = dateCount;
		this.distance = distance;
	}
	
	

	public Research(int sitterNo, String sitterName, String sitterTitle, String additions, String smallNightFee,
			String smallDayFee, int avgRating, String path, int dateCount, Double distance) {
		super();
		this.sitterNo = sitterNo;
		this.sitterName = sitterName;
		this.sitterTitle = sitterTitle;
		this.additions = additions;
		this.smallNightFee = smallNightFee;
		this.smallDayFee = smallDayFee;
		this.avgRating = avgRating;
		this.path = path;
		this.dateCount = dateCount;
		this.distance = distance;
	}

	

	public Research(int sitterNo, String sitterName, String address, String license, String sitterTitle,
			String sitterContent, String additions, String smallNightFee, String midNightFee, String bigNightFee,
			String smallDayFee, String midDayFee, String bigDayFee, int avgRating, int checkin, int checkout,
			String ableDate, String path) {
		super();
		this.sitterNo = sitterNo;
		this.sitterName = sitterName;
		this.address = address;
		this.license = license;
		this.sitterTitle = sitterTitle;
		this.sitterContent = sitterContent;
		this.additions = additions;
		this.smallNightFee = smallNightFee;
		this.midNightFee = midNightFee;
		this.bigNightFee = bigNightFee;
		this.smallDayFee = smallDayFee;
		this.midDayFee = midDayFee;
		this.bigDayFee = bigDayFee;
		this.avgRating = avgRating;
		this.checkin = checkin;
		this.checkout = checkout;
		this.ableDate = ableDate;
		this.path = path;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public String getSitterTitle() {
		return sitterTitle;
	}

	public void setSitterTitle(String sitterTitle) {
		this.sitterTitle = sitterTitle;
	}

	public String getSitterContent() {
		return sitterContent;
	}

	public void setSitterContent(String sitterContent) {
		this.sitterContent = sitterContent;
	}

	public String getAdditions() {
		return additions;
	}

	public void setAdditions(String additions) {
		this.additions = additions;
	}

	public String getSmallNightFee() {
		return smallNightFee;
	}

	public void setSmallNightFee(String smallNightFee) {
		this.smallNightFee = smallNightFee;
	}

	public String getMidNightFee() {
		return midNightFee;
	}

	public void setMidNightFee(String midNightFee) {
		this.midNightFee = midNightFee;
	}

	public String getBigNightFee() {
		return bigNightFee;
	}

	public void setBigNightFee(String bigNightFee) {
		this.bigNightFee = bigNightFee;
	}

	public String getSmallDayFee() {
		return smallDayFee;
	}

	public void setSmallDayFee(String smallDayFee) {
		this.smallDayFee = smallDayFee;
	}

	public String getMidDayFee() {
		return midDayFee;
	}

	public void setMidDayFee(String midDayFee) {
		this.midDayFee = midDayFee;
	}

	public String getBigDayFee() {
		return bigDayFee;
	}

	public void setBigDayFee(String bigDayFee) {
		this.bigDayFee = bigDayFee;
	}

	public int getAvgRating() {
		return avgRating;
	}

	public void setAvgRating(int avgRating) {
		this.avgRating = avgRating;
	}

	public int getCheckin() {
		return checkin;
	}

	public void setCheckin(int checkin) {
		this.checkin = checkin;
	}

	public int getCheckout() {
		return checkout;
	}

	public void setCheckout(int checkout) {
		this.checkout = checkout;
	}

	public String getAbleDate() {
		return ableDate;
	}

	public void setAbleDate(String ableDate) {
		this.ableDate = ableDate;
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
		return "Research [sitterNo=" + sitterNo + ", sitterName=" + sitterName + ", address=" + address + ", license="
				+ license + ", sitterTitle=" + sitterTitle + ", sitterContent=" + sitterContent + ", additions="
				+ additions + ", smallNightFee=" + smallNightFee + ", midNightFee=" + midNightFee + ", bigNightFee="
				+ bigNightFee + ", smallDayFee=" + smallDayFee + ", midDayFee=" + midDayFee + ", bigDayFee=" + bigDayFee
				+ ", avgRating=" + avgRating + ", checkin=" + checkin + ", checkout=" + checkout + ", ableDate="
				+ ableDate + ", path=" + path + ", dateCount=" + dateCount + ", distance=" + distance + "]";
	}

	
	
	
	
}
