package com.petnolja.admin.model.service;

import java.sql.Connection;

import com.petnolja.admin.model.dao.AdminDao;
import com.petnolja.admin.model.vo.Admin;

import static com.petnolja.common.JDBCTemplate.*;

public class AdminService {
	
	/** 최서경
	 * 관리자 로그인
	 */
	public Admin adminLogin(String adminId, String adminPwd) {
		
		Connection conn = getConnection();
		Admin loginAdmin = new AdminDao().adminLogin(conn, adminId, adminPwd);
		
		close(conn);
		return loginAdmin;
	}

}
