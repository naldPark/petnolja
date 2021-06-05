package com.petnolja.sitter.model.dao;

import static com.petnolja.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.petsitter.model.vo.Petsitter;
import com.petnolja.qna.model.vo.Qna;
import com.petnolja.research.model.vo.Research;

public class SitterDao {
	
	private Properties prop = new Properties();
	
	public SitterDao() {
		
		String fileName = SitterDao.class.getResource("/sql/sitter/sitter-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int applySitterInsert(Connection conn, Petsitter s) {
		int result= 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("applySitterInsert");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s.getSitterNo());
			pstmt.setString(2, s.getPetPeriod());
			pstmt.setString(3, s.getPetNo());
			pstmt.setString(4, s.getLicense());
			pstmt.setString(5, s.getExperience());
			pstmt.setString(6, s.getMotive());
			pstmt.setString(7, s.getAddContent());
			result = pstmt.executeUpdate();
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
//	public void selectReserveList(Connection conn, int userNo) {
//		
//		PreparedStatement pstmt = null;
//		String sql = prop.getProperty("selectReserveList");
//		
//		
//	}
	
	
	public Research selectCurrentOptions(Connection conn, int userNo) {
		Research r = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectCurrentOptions");
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
		if(rset.next()) {
			r = new Research(rset.getInt("Mem_no"),
							rset.getString("Mem_name"),
				   		    String.format("%,d",rset.getInt("OSMALL")),
						    String.format("%,d",rset.getInt("OMID")),
						    String.format("%,d",rset.getInt("OBIG")),
						    String.format("%,d",rset.getInt("DSMALL")),
						    String.format("%,d",rset.getInt("DMID")),
						    String.format("%,d",rset.getInt("DBIG")),
						    rset.getString("additions")							  
							  );
		}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return r;
		
	}
	
	
	public int reserveWaitingCount(Connection conn, int userNo) {
		int count = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("sitterWaitingCount");
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
		if(rset.next()) {
			count = rset.getInt("count");
		}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	
	public int reserveConfirmCount(Connection conn, int userNo) {
		int count = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("sitterConfirmCount");
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
		if(rset.next()) {
			count = rset.getInt("count");
		}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	
}
	

