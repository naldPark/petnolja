package com.petnolja.petsitter.model.dao;

import com.petnolja.petsitter.model.vo.Petsitter;
import static com.petnolja.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

public class PetsitterDao {
	
	private Properties prop = new Properties();
	
	public PetsitterDao() {
		
		String fileName = PetsitterDao.class.getResource("/sql/petsitter/petsitter-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public ArrayList<Petsitter> selectOldPetsitterList(Connection conn){
		ArrayList<Petsitter> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOldPetsitterList");
	
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Petsitter(rset.getString("mem_id"),
									rset.getInt("sitter_no"),
									rset.getString("sitter_access").charAt(0),
									rset.getString("pet_period"),
									rset.getString("pet_no"),
									rset.getString("license"),
									rset.getString("experience"),
									rset.getString("motive"),
									rset.getString("promotion_status").charAt(0),
									rset.getDate("promotion_date"),
									rset.getString("stop_reason"),
									rset.getString("stop_content"),
									rset.getInt("penalty_count"),
									rset.getString("additions")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	
	public ArrayList<Petsitter> selectNewPetsitterList(Connection conn){
		ArrayList<Petsitter> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNewPetsitterList");
	
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Petsitter(rset.getString("mem_id"),
									rset.getInt("sitter_no"),
									rset.getString("sitter_access").charAt(0),
									rset.getString("pet_period"),
									rset.getString("pet_no"),
									rset.getString("license"),
									rset.getString("experience"),
									rset.getString("motive"),
									rset.getString("promotion_status").charAt(0),
									rset.getDate("promotion_date"),
									rset.getString("additions")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public Petsitter selectNewPetsitter(Connection conn, int sitterNo) {
		// select문 => ResultSet객체 (한행)
		Petsitter p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNewPetsitter");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sitterNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Petsitter(rset.getString("sitter_no"),
								rset.getInt("mem_id"),
								rset.getString("pet_period"),
								rset.getString("pet_no"),
								rset.getString("license"),
								rset.getString("experience"),
								rset.getString("motive"),
								rset.getString("add_content"),
								rset.getString("additions"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
		
	}

	
	
}
