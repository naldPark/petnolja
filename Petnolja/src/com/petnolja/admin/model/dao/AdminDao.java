package com.petnolja.admin.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.petnolja.admin.model.vo.Admin;
import static com.petnolja.common.JDBCTemplate.*;

public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao() {
		
		String fileName = AdminDao.class.getResource("/sql/admin/admin-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	/** 최서경
	 * 관리자 로그인
	 */
	public Admin adminLogin(Connection conn, String adminId, String adminPwd) {
	
		Admin loginAdmin = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminLogin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adminId);
			pstmt.setString(2, adminPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginAdmin = new Admin(rset.getInt("admin_no"),
									   rset.getString("admin_id"),
									   rset.getString("admin_pwd"),
									   rset.getString("admin_email"),
									   rset.getString("admin_phone"),
									   rset.getString("admin_status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return loginAdmin;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
