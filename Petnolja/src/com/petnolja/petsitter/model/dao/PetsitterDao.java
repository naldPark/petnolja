package com.petnolja.petsitter.model.dao;

import com.petnolja.common.model.vo.PageInfo;
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
	
	public int selectOldListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOldListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;		
		
	}
	
	public int selectNewListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNewListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;		
		
	}
	
	
	public ArrayList<Petsitter> selectOldPetsitterList(Connection conn, PageInfo pi){
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		ArrayList<Petsitter> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOldPetsitterList");
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
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
	
	
	public ArrayList<Petsitter> selectNewPetsitterList(Connection conn, PageInfo pi){
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		ArrayList<Petsitter> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNewPetsitterList");
	
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
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

	public int[] deleteOldPetsitter(Connection conn, String[] petsitterNo) {
		// update문 => 처리된 행수
		int result[] = new int[petsitterNo.length];
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteOldPetsitter");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<petsitterNo.length; i++) {
				pstmt.setInt(1, Integer.parseInt(petsitterNo[i]));
				result[i] = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
