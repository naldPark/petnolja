package com.petnolja.pet.model.vo;

import java.util.Date;

public class Pet {
	
	private int petNo;
	private int memNo;
	private String petName;
	private Date petBirth;
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
	
	public Pet() {}

	public Pet(int petNo, int memNo, String petName, Date petBirth, double petWeight, String petGender, String petSize,
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

	public Date getPetBirth() {
		return petBirth;
	}

	public void setPetBirth(Date petBirth) {
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
