package com.petnolja.memreserve.model.vo;

public class ReserveContent {
	
	
	private int petNo;
	private int memNo;
	private int sitterNo;
	private String sitterName;
	private String petName;
	private String petBirth;
	private String petSize;
	private String petGender;
	private String checkinDate;
	private String checkoutDate;
	private int countDays;
	private int checkinTime;
	private int checkoutTime;
	private int price;
	private String petImg;
	

	public ReserveContent() {}

	public ReserveContent(int petNo, int memNo, int sitterNo, String sitterName, String petName, String petBirth,
			String petSize, String petGender, String checkinDate, String checkoutDate, int countDays,
			int checkinTime, int checkoutTime, int price, String petImg) {
		super();
		this.petNo = petNo;
		this.memNo = memNo;
		this.sitterNo = sitterNo;
		this.sitterName = sitterName;
		this.petName = petName;
		this.petBirth = petBirth;
		this.petSize = petSize;
		this.petGender = petGender;
		this.checkinDate = checkinDate;
		this.checkoutDate = checkoutDate;
		this.countDays = countDays;
		this.checkinTime = checkinTime;
		this.checkoutTime = checkoutTime;
		this.price = price;
		this.petImg = petImg;
	}
	
	public ReserveContent(int petNo, int memNo, int sitterNo, String sitterName, String petName, String petBirth,
			String petSize, String petGender, String checkinDate, String checkoutDate,
			int checkinTime, int checkoutTime, int price, String petImg) {
		super();
		this.petNo = petNo;
		this.memNo = memNo;
		this.sitterNo = sitterNo;
		this.sitterName = sitterName;
		this.petName = petName;
		this.petBirth = petBirth;
		this.petSize = petSize;
		this.petGender = petGender;
		this.checkinDate = checkinDate;
		this.checkoutDate = checkoutDate;
		this.checkinTime = checkinTime;
		this.checkoutTime = checkoutTime;
		this.price = price;
		this.petImg = petImg;
	}



	public int getPetNo() {
		return petNo;
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




	public String getPetName() {
		return petName;
	}




	public String getPetBirth() {
		return petBirth;
	}




	public String getPetSize() {
		return petSize;
	}




	public String getPetGender() {
		return petGender;
	}




	public String getCheckinDate() {
		return checkinDate;
	}




	public String getCheckoutDate() {
		return checkoutDate;
	}




	public int getCountDays() {
		return countDays;
	}




	public int getCheckinTime() {
		return checkinTime;
	}




	public int getCheckoutTime() {
		return checkoutTime;
	}




	public int getPrice() {
		return price;
	}




	public String getPetImg() {
		return petImg;
	}




	public void setPetNo(int petNo) {
		this.petNo = petNo;
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




	public void setPetName(String petName) {
		this.petName = petName;
	}




	public void setPetBirth(String petBirth) {
		this.petBirth = petBirth;
	}




	public void setPetSize(String petSize) {
		this.petSize = petSize;
	}




	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}




	public void setCheckinDate(String checkinDate) {
		this.checkinDate = checkinDate;
	}




	public void setCheckoutDate(String checkoutDate) {
		this.checkoutDate = checkoutDate;
	}




	public void setCountDays(int countDays) {
		this.countDays = countDays;
	}




	public void setCheckinTime(int checkinTime) {
		this.checkinTime = checkinTime;
	}




	public void setCheckoutTime(int checkoutTime) {
		this.checkoutTime = checkoutTime;
	}




	public void setPrice(int price) {
		this.price = price;
	}




	public void setPetImg(String petImg) {
		this.petImg = petImg;
	}




	@Override
	public String toString() {
		return "ReserveContent [petNo=" + petNo + ", memNo=" + memNo + ", sitterNo=" + sitterNo + ", sitterName="
				+ sitterName + ", petName=" + petName + ", petBirth=" + petBirth + ", petSize=" + petSize
				+ ", petGender=" + petGender + ", checkinDate=" + checkinDate + ", checkoutDate=" + checkoutDate
				+ ", countDays=" + countDays + ", checkinTime=" + checkinTime + ", checkoutTime=" + checkoutTime
				+ ", price=" + price + ", petImg=" + petImg + "]";
	}


	
	
}
