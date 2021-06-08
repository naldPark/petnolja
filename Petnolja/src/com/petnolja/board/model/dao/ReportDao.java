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
import com.petnolja.notice.model.vo.Notice;

public class ReportDao {
	
	private Properties prop = new Properties();
	
	public ReportDao() {
		try {
			prop.loadFromXML(new FileInputStream(ReportDao.class.getResource("/sql/board/board-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 
	 * @author 주이진
	 * 
	 * 일반 신고 리스트 불러옴
	 */
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
				Qlist.add(new Report(rset.getInt("report_no"),
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
				Rlist.add(new Report(rset.getInt("report_no"),
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
	
	
	/**
	 * 
	 * @author 주이진
	 * 
	 * 키워드에 해당하는 신고리스트 불러옴
	 */
	public int selectQNAListCount(Connection conn, String keyword) {
		// select문 => ResultSet객체 (한행)
		int QlistCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectKeyQNAListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
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
	
	public int selectRevListCount(Connection conn, String keyword) {
		// select문 => ResultSet객체 (한행)
		int RlistCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectKeyRevListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			
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
	
	public ArrayList<Report> selectQNAList(Connection conn, PageInfo Qpi, String keyword){
		// select문 => ResultSet(여러행)
		ArrayList<Report> Qlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectKeyQNAList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (Qpi.getCurrentPage() - 1) * Qpi.getBoardLimit() + 1;
			int endRow = startRow + Qpi.getBoardLimit() - 1;
			
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Qlist.add(new Report(rset.getInt("report_no"),
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
	
	public ArrayList<Report> selectRevList(Connection conn, PageInfo Rpi, String keyword){
		// select문 => ResultSet(여러행)
		int startRow = (Rpi.getCurrentPage() - 1) * Rpi.getBoardLimit() + 1;
		int endRow = startRow + Rpi.getBoardLimit() - 1;
		
		ArrayList<Report> Rlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectKeyRevList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Rlist.add(new Report(rset.getInt("report_no"),
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
	
	public int undoQnaReport(Connection conn, String[] list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("undoQnaReport");
		
		try {
			int num = 0;
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<list.length; i++) {
				
				num = Integer.parseInt(list[i]);
				
				pstmt.setInt(1, num);
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int undoRevReport(Connection conn, String[] list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("undoRevReport");
		
		try {
			int num = 0;
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<list.length; i++) {
				
				num = Integer.parseInt(list[i]);
				
				pstmt.setInt(1, num);
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteQnaReport(Connection conn, String[] list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteQnaReport");
		
		try {
			int num = 0;
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<list.length; i++) {
				
				num = Integer.parseInt(list[i]);
				
				pstmt.setInt(1, num);
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteRevReport(Connection conn, String[] list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteRevReport");
		
		try {
			int num = 0;
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<list.length; i++) {
				
				num = Integer.parseInt(list[i]);
				
				pstmt.setInt(1, num);
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int undoListDone(Connection conn, String[] list) {
		int dresult = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("undoListDone");
		
		try {
			int num = 0;
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<list.length; i++) {
				
				num = Integer.parseInt(list[i]);
				
				pstmt.setInt(1, num);
				dresult += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return dresult;
	}
	
	public int deleteListDone(Connection conn, String[] list) {
		int dresult = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteListDone");
		
		try {
			int num = 0;
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<list.length; i++) {
				
				num = Integer.parseInt(list[i]);
				
				pstmt.setInt(1, num);
				dresult += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return dresult;
	}
	
	public Report qnaReportDetail(Connection conn, int rno) {
		Report r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("qnaReportDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Report(rset.getInt("report_no")
							 , rset.getString("title")
							 , rset.getString("reporter_id")
							 , rset.getString("writer_id")
							 , rset.getString("content"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}
	
	public Report revReportDetail(Connection conn, int rno) {
		Report r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("revReportDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Report(rset.getInt("report_no")
							 , rset.getString("title")
							 , rset.getString("reporter_id")
							 , rset.getString("writer_id")
							 , rset.getString("content"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}

}
