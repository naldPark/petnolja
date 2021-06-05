package com.petnolja.memboard.model.dao;

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
import com.petnolja.memboard.model.vo.MemBoard;
import com.petnolja.qna.model.vo.Qna;
public class MemBoardDao {
	
	private Properties prop = new Properties();

	public MemBoardDao() {
		
		String fileName = MemBoardDao.class.getResource("/sql/memboard/memboard-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int askToAdminListCount(Connection conn, int userNo) {
			
			int listCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("askToAdminListCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				rset = pstmt.executeQuery();
				
				if(rset.next()){
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
		
		
	
	public ArrayList<Qna> askToAdminList(Connection conn, PageInfo pi, int userNo) {
		
		int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() -1;
		
		ArrayList<Qna> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("askToAdminList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Qna(
								rset.getInt("RNUM")
								,rset.getInt("qna_no")
							   , rset.getString("q_mem_no")
							   , rset.getString("mem_name")
							   , rset.getString("q_category")
							   , rset.getString("q_title")
							   , rset.getDate("q_create_date")
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
	
	public Qna askToAdminDetail(Connection conn, int qNo, int userNo) {
		
		Qna q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("askToAdminDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qNo);
			pstmt.setInt(2, userNo);
			
			rset = pstmt.executeQuery();
			
		if(rset.next()) {
			q = new Qna(rset.getInt("QNA_NO"),
				   			  rset.getString("Q_MEM_NO"),
							  rset.getString("Q_CATEGORY"),
							  rset.getString("MEM_NAME"),
							  rset.getString("Q_TITLE"),
							  rset.getString("Q_CONTENT"),
							  rset.getString("A_CONTENT"),
							  rset.getDate("A_create_date"));
		}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return q;
	}
	
	public int askToAdminInsert(Connection conn, int userNo, String subject, String title, String content) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("askToAdminInsert");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, subject);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	// 목록 갯수 뽑기
	public int askToPet(Connection conn, int aSitterNo) {
		// select문
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("askToPet");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, aSitterNo);
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
	
	// qna 전체 조회
	public ArrayList<MemBoard> selectAsktoPet(Connection conn, PageInfo pi, int aSitterNo){
		// select문
		ArrayList<MemBoard> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAsktoPet");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, aSitterNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new MemBoard(rset.getInt("qna_no"),
						 			   rset.getInt("q_mem_no"),
						 			   rset.getInt("a_sitter_no"),
						 			   rset.getString("mem_name"),
						 			   rset.getString("q_title"),
						 			   rset.getString("q_secret"),
						 			   rset.getDate("q_create_date")));	
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	
	}
	
	// qna 상세조회
		public Qna askToPetDetail(Connection conn, int qno) {
			// select문
			Qna q = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("askToPetDetail");
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, qno);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					q = new Qna(rset.getInt("QNA_NO"),
				   			  rset.getString("Q_MEM_NO"),
				   			  rset.getString("Q_TITLE"),
				   			  rset.getString("Q_CONTENT"),
				   			  rset.getDate("Q_CREATE_DATE"),
				   			  rset.getString("A_CONTENT"),
							  rset.getDate("A_CREATE_DATE"),
							  rset.getString("MEM_NAME"));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
	
			return q;
	}
		
		public int askPetSitterInsert(Connection conn, int userNo, String title, String content) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("askPetSitterInsert");
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				pstmt.setString(2, title);
				pstmt.setString(3, content);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
		
		
		
}
