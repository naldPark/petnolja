package com.petnolja.memreserve.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.petnolja.common.JDBCTemplate.*;
import com.petnolja.memreserve.vo.MemReserve;

public class MemReserveDao {
	
	
	private Properties prop = new Properties();

	public MemReserveDao() {

		String fileName = MemReserveDao.class.getResource("/sql/memreserve/memreserve-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	public ArrayList<MemReserve> reserveList(Connection conn, int userNo, String startDate, String endDate) {
		ArrayList<MemReserve> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reserveList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			pstmt.setString(4, startDate);
			pstmt.setString(5, endDate);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				list.add(new MemReserve(
						rset.getInt("SITTER_NO"),
						rset.getString("SITTER_TITLE"),
						rset.getString("MEM_NAME"),
					    rset.getLong("RES_NO"),
					    rset.getDate("RES_DATE"),
					    rset.getString("RES_CHECKIN"),
					    rset.getString("RES_CHECKOUT"),
					    rset.getString("RES_STATUS"),
						rset.getString("CANCEL_REASON"),
						rset.getString("RES_STATUS"),
						rset.getString("PATH")));
					    }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	
	}

}
