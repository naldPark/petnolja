package com.petnolja.research.model.vo;

import java.util.Arrays;

public class UserSetSearch {
	// 유저가 설정한 검색조건을 담는 객체입니다	
	
	private String setDate; // 날짜설정 여부 (y,n)
	private int countDay;  // 유저가 선택한 기간의 총 일수
	private String searchStartDate; // 유저가 선택한 기간 검색에서 시작날짜
	private String searchEndDate; // 유저가 선택한 기간 검색에서 끝나는날짜
	private String setAddress; // 주소설정 여부 (y,n)
	private String address; // 유저가 검색한 위치 주소
	private Double latitude;  // 유저가 검색한 위치의 위도
	private Double longtitude;  // 유저가 검색한 위치의 경도
	private String[] options; // 유저가 설정한 옵션
	
	
	
	public UserSetSearch() {}
	
	
	public UserSetSearch(String setDate, int countDay, String searchStartDate, String searchEndDate, String setAddress,
			String address, Double latitude, Double longtitude, String[] options) {
		super();
		this.setDate = setDate;
		this.countDay = countDay;
		this.searchStartDate = searchStartDate;
		this.searchEndDate = searchEndDate;
		this.setAddress = setAddress;
		this.address = address;
		this.latitude = latitude;
		this.longtitude = longtitude;
		this.options = options;
	}
	
	public String getSetDate() {
		return setDate;
	}
	public void setSetDate(String setDate) {
		this.setDate = setDate;
	}
	public int getCountDay() {
		return countDay;
	}
	public void setCountDay(int countDay) {
		this.countDay = countDay;
	}
	public String getSearchStartDate() {
		return searchStartDate;
	}
	public void setSearchStartDate(String searchStartDate) {
		this.searchStartDate = searchStartDate;
	}
	public String getSearchEndDate() {
		return searchEndDate;
	}
	public void setSearchEndDate(String searchEndDate) {
		this.searchEndDate = searchEndDate;
	}
	public String getSetAddress() {
		return setAddress;
	}
	public void setSetAddress(String setAddress) {
		this.setAddress = setAddress;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	public Double getLongtitude() {
		return longtitude;
	}
	public void setLongtitude(Double longtitude) {
		this.longtitude = longtitude;
	}
	public String[] getOptions() {
		return options;
	}
	public void setOptions(String[] options) {
		this.options = options;
	}
	@Override
	public String toString() {
		return "UserSetSearch [setDate=" + setDate + ", countDay=" + countDay + ", searchStartDate=" + searchStartDate
				+ ", searchEndDate=" + searchEndDate + ", setAddress=" + setAddress + ", address=" + address
				+ ", latitude=" + latitude + ", longtitude=" + longtitude + ", options=" + Arrays.toString(options)
				+ "]";
	}
	
	
	
	
	
	

}
