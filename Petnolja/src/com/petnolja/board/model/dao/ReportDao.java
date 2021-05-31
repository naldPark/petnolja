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
	
	public int selectReportListCount(Connection conn) {
		// select문 => ResultSet객체 (한행)
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportListCount");
		
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
	
	public ArrayList<Report> selectReportList(Connection conn, PageInfo pi){
		// select문 => ResultSet(여러행)
		ArrayList<Report> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportList");
		
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
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Report(rset.getInt("report_no"),
								   rset.getInt("report_sort"),
								   rset.getInt("origin_no"),
								   rset.getDate("reported_date"),
								   rset.getString("done").charAt(0),
								   rset.getInt("mem_no")));
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
