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
}
	

