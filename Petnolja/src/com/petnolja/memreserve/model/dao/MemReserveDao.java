package com.petnolja.memreserve.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.petnolja.memreserve.model.vo.ReserveContent;
import com.petnolja.memreserve.model.vo.MemReserve;

import static com.petnolja.common.JDBCTemplate.*;

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
	
	
	
	public ArrayList<ReserveContent> reserveProceed(Connection conn, int sitterNo, String petList, String careDay, String startDate, String endDate) {
		ArrayList<ReserveContent> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reserveProceed");
		sql+="WHERE P.PET_NO IN ("+petList+") AND S.SITTER_NO=? AND PET_CARE =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sitterNo);
			pstmt.setString(2, careDay);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				list.add(new ReserveContent(
						rset.getInt("PET_NO"),
						rset.getInt("MEM_NO"),
						rset.getInt("SITTER_NO"),
						rset.getString("SITTER_NAME"),
						rset.getString("PET_NAME"),
					    rset.getString("PET_BIRTH"),
					    rset.getString("PET_SIZE"),
					    rset.getString("PET_GENDER"),
					    startDate,
					    endDate,
						rset.getInt("SITTER_CHECKIN"),
						rset.getInt("SITTER_CHECKOUT"),
						rset.getInt("FEE"),
						rset.getString("PET_IMG")						
				));
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
