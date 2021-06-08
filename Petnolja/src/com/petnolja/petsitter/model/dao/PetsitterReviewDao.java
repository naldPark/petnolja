package com.petnolja.petsitter.model.dao;

import static com.petnolja.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.pet.model.vo.Log;
import com.petnolja.petsitter.model.vo.Petsitter;
import com.petnolja.petsitter.model.vo.PetsitterReview;
import com.petnolja.qna.model.vo.Qna;

public class PetsitterReviewDao {
	
	private Properties prop = new Properties();
	
	public PetsitterReviewDao() {
		
		String fileName = PetsitterReviewDao.class.getResource("/sql/petsitter/petsitter-mapper2.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

		public ArrayList<PetsitterReview> selectReview(Connection conn, int sitterNo){
			//select문
			ArrayList<PetsitterReview> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectReview");
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, sitterNo);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new PetsitterReview
								(rset.getInt("SITTER_NO"),
								 rset.getLong("RES_NO"),
								 rset.getDate("RES_DATE"),
								 rset.getString("RES_CHECKIN"),
								 rset.getString("RES_CHECKOUT"),
								 rset.getString("MEM_NAME"),
								 rset.getInt("REV_NO"),
								 rset.getInt("REV_RATING"),
								 rset.getString("REV_STATUS"),
								 rset.getString("REV_CONTENT")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
			
			return list;
		}
	
}

