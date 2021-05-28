package com.petnolja.admin.model.vo;

public class Admin {

	private int adminNo;
	private String adminId;
	private String adminPwd;
	private String adminEmail;
	private String adminPhone;
	private String adminStatus;
	
	public Admin() {};
	
	public Admin(int adminNo, String adminId, String adminPwd, String adminEmail, String adminPhone,
			String adminStatus) {
		super();
		this.adminNo = adminNo;
		this.adminId = adminId;
		this.adminPwd = adminPwd;
		this.adminEmail = adminEmail;
		this.adminPhone = adminPhone;
		this.adminStatus = adminStatus;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPwd() {
		return adminPwd;
	}

	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}

	public String getAdminEmail() {
		return adminEmail;
	}

	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}

	public String getAdminPhone() {
		return adminPhone;
	}

	public void setAdminPhone(String adminPhone) {
		this.adminPhone = adminPhone;
	}

	public String getAdminStatus() {
		return adminStatus;
	}

	public void setAdminStatus(String adminStatus) {
		this.adminStatus = adminStatus;
	}

	@Override
	public String toString() {
		return "Admin [adminNo=" + adminNo + ", adminId=" + adminId + ", adminPwd=" + adminPwd + ", adminEmail="
				+ adminEmail + ", adminPhone=" + adminPhone + ", adminStatus=" + adminStatus + "]";
	}
	
	
	
}
