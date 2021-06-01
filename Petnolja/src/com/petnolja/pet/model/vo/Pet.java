package com.petnolja.pet.model.vo;

import java.util.Date;

public class Pet {
	
	private int petNo;
	private int memNo;
	private String petName;
	private String petBirth;
	private double petWeight;
	private String petGender;
	private String petSize;
	private String petBreed;
	private String petStatus;
	private Date petEnrollDate;
	private String petImg;
	private String vaccine;
	private String caution;
	private String note;
	private String hospi;
	private String hospiTel;
	private String neutered;
	private String chip;
	private String favorite; // 견주의 즐겨찾기 여부확인을 위해 추가 
	
	public Pet() {}

	public Pet(int petNo, int memNo, String petName, String petBirth, double petWeight, String petGender, String petSize,
			String petBreed, String petStatus, Date petEnrollDate, String petImg, String vaccine, String caution,
			String note, String hospi, String hospiTel, String neutered, String chip) {
		super();
		this.petNo = petNo;
		this.memNo = memNo;
		this.petName = petName;
		this.petBirth = petBirth;
		this.petWeight = petWeight;
		this.petGender = petGender;
		this.petSize = petSize;
		this.petBreed = petBreed;
		this.petStatus = petStatus;
		this.petEnrollDate = petEnrollDate;
		this.petImg = petImg;
		this.vaccine = vaccine;
		this.caution = caution;
		this.note = note;
		this.hospi = hospi;
		this.hospiTel = hospiTel;
		this.neutered = neutered;
		this.chip = chip;
	}
	
	
	public Pet(int petNo, int memNo, String petName, String petBirth, String petGender, String petSize, String favorite, String petImg) {
		super();
		this.petNo = petNo;
		this.memNo = memNo;
		this.petName = petName;
		this.petBirth = petBirth;
		this.petGender = petGender;
		this.petSize = petSize;
		this.favorite = favorite;
		this.petImg = petImg;
	}

	
	public Pet(int petNo, String petName, String petBirth, double petWeight, String petGender, String petBreed,
			String petImg, String vaccine, String caution, String note, String hospi, String hospiTel, String neutered,
			String chip) {
		super();
		this.petNo = petNo;
		this.petName = petName;
		this.petBirth = petBirth;
		this.petWeight = petWeight;
		this.petGender = petGender;
		this.petBreed = petBreed;
		this.petImg = petImg;
		this.vaccine = vaccine;
		this.caution = caution;
		this.note = note;
		this.hospi = hospi;
		this.hospiTel = hospiTel;
		this.neutered = neutered;
		this.chip = chip;
	}
	
	

	/** 최서경
	 * 특정 회원의 펫 상세 조회시 사용
	 */
	public Pet(String petBirth, double petWeight, String petGender, String petSize,
			String petBreed, String petImg, String vaccine, String caution, String note, String hospi, String hospiTel,
			String neutered, String chip) {
		super();
		this.petBirth = petBirth;
		this.petWeight = petWeight;
		this.petGender = petGender;
		this.petSize = petSize;
		this.petBreed = petBreed;
		this.petImg = petImg;
		this.vaccine = vaccine;
		this.caution = caution;
		this.note = note;
		this.hospi = hospi;
		this.hospiTel = hospiTel;
		this.neutered = neutered;
		this.chip = chip;
	}

	public Pet(int petNo, String petName, String petBirth, double petWeight, String petGender, String petSize,
			String petBreed, String petImg) {
		super();
		this.petNo = petNo;
		this.petName = petName;
		this.petBirth = petBirth;
		this.petWeight = petWeight;
		this.petGender = petGender;
		this.petSize = petSize;
		this.petBreed = petBreed;
		this.petImg = petImg;
	}

	/** 최서경
	 * 특정 회원의 펫 목록 조회시 사용
	 */
	public Pet(int petNo, String petName) {
		super();
		this.petNo = petNo;
		this.petName = petName;
	}
	
	

	public int getPetNo() {
		return petNo;
	}

	public void setPetNo(int petNo) {
		this.petNo = petNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public String getPetBirth() {
		return petBirth;
	}

	public void setPetBirth(String petBirth) {
		this.petBirth = petBirth;
	}

	public double getPetWeight() {
		return petWeight;
	}

	public void setPetWeight(double petWeight) {
		this.petWeight = petWeight;
	}

	public String getPetGender() {
		return petGender;
	}

	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}

	public String getPetSize() {
		return petSize;
	}

	public void setPetSize(String petSize) {
		this.petSize = petSize;
	}

	public String getPetBreed() {
		return petBreed;
	}

	public void setPetBreed(String petBreed) {
		this.petBreed = petBreed;
	}

	public String getPetStatus() {
		return petStatus;
	}

	public void setPetStatus(String petStatus) {
		this.petStatus = petStatus;
	}

	public Date getPetEnrollDate() {
		return petEnrollDate;
	}

	public void setPetEnrollDate(Date petEnrollDate) {
		this.petEnrollDate = petEnrollDate;
	}

	public String getPetImg() {
		return petImg;
	}

	public void setPetImg(String petImg) {
		this.petImg = petImg;
	}

	public String getVaccine() {
		return vaccine;
	}

	public void setVaccine(String vaccine) {
		this.vaccine = vaccine;
	}

	public String getCaution() {
		return caution;
	}

	public void setCaution(String caution) {
		this.caution = caution;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getHospi() {
		return hospi;
	}

	public void setHospi(String hospi) {
		this.hospi = hospi;
	}

	public String getHospiTel() {
		return hospiTel;
	}

	public void setHospiTel(String hospiTel) {
		this.hospiTel = hospiTel;
	}

	public String getNeutered() {
		return neutered;
	}

	public void setNeutered(String neutered) {
		this.neutered = neutered;
	}

	public String getChip() {
		return chip;
	}

	public void setChip(String chip) {
		this.chip = chip;
	}

	@Override
	public String toString() {
		return "Pet [petNo=" + petNo + ", memNo=" + memNo + ", petName=" + petName + ", petBirth=" + petBirth
				+ ", petWeight=" + petWeight + ", petGender=" + petGender + ", petSize=" + petSize + ", petBreed="
				+ petBreed + ", petStatus=" + petStatus + ", petEnrollDate=" + petEnrollDate + ", petImg=" + petImg
				+ ", vaccine=" + vaccine + ", caution=" + caution + ", note=" + note + ", hospi=" + hospi
				+ ", hospiTel=" + hospiTel + ", neutered=" + neutered + ", chip=" + chip + "]";
	}
	
	
	
	
	

}
