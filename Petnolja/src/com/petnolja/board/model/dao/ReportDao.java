package com.petnolja.board.model.dao;

import static com.petnolja.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import com.petnolja.board.model.vo.Report;
import com.petnolja.common.model.vo.PageInfo;

public class ReportDao {
	
	private Properties prop = new Properties();
	
	public ReportDao() {
		try {
			prop.loadFromXML(new FileInputStream(ReportDao.class.getResource("/sql/board/board-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectQNAListCount(Connection conn) {
		// select문 => ResultSet객체 (한행)
		int QlistCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQNAListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				QlistCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return QlistCount;		
		
	}
	
	public int selectRevListCount(Connection conn) {
		// select문 => ResultSet객체 (한행)
		int RlistCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRevListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				RlistCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return RlistCount;		
		
	}
	
	public ArrayList<Report> selectQNAList(Connection conn, PageInfo Qpi){
		// select문 => ResultSet(여러행)
		ArrayList<Report> Qlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQNAList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			/*
			 * ex) boardLimit : 10 라는 가정하에
			 * currentPage = 1	=> 시작값 : 1   끝값 : 10
			 * currentPage = 2	=> 시작값 : 11 끝값 : 20
			 * currentPage = 3	=> 시작값 : 21 끝값 : 30
			 * 
			 * 시작값 = (currentPage - 1) * boardLimit + 1
			 * 끝값 = 시작값 + boardLimit - 1
			 */
			int startRow = (Qpi.getCurrentPage() - 1) * Qpi.getBoardLimit() + 1;
			int endRow = startRow + Qpi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Report(rset.getInt("report_no"),
								   rset.getString("title"),
								   rset.getString("writer_id"),
								   rset.getDate("create_date"),
								   rset.getString("reporter_Id"),
								   rset.getDate("reported_date")));
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return Qlist;	
	}
	
	public ArrayList<Report> selectRevList(Connection conn, PageInfo Rpi){
		// select문 => ResultSet(여러행)
		ArrayList<Report> Rlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRevList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			/*
			 * ex) boardLimit : 10 라는 가정하에
			 * currentPage = 1	=> 시작값 : 1   끝값 : 10
			 * currentPage = 2	=> 시작값 : 11 끝값 : 20
			 * currentPage = 3	=> 시작값 : 21 끝값 : 30
			 * 
			 * 시작값 = (currentPage - 1) * boardLimit + 1
			 * 끝값 = 시작값 + boardLimit - 1
			 */
			int startRow = (Rpi.getCurrentPage() - 1) * Rpi.getBoardLimit() + 1;
			int endRow = startRow + Rpi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Report(rset.getInt("report_no"),
								   rset.getString("title"),
								   rset.getString("writer_id"),
								   rset.getDate("create_date"),
								   rset.getString("reporter_Id"),
								   rset.getDate("reported_date")));
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return Rlist;	
	}

}
