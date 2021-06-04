package com.petnolja.board.model.dao;


import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.petnolja.board.model.vo.MemNotice;
import com.petnolja.common.model.vo.PageInfo;

import static com.petnolja.common.JDBCTemplate.*;

public class MemNoticeDao {
	
	private Properties prop = new Properties();
	
	public MemNoticeDao() {
		
		String fileName = MemNoticeDao.class.getResource("/sql/board/memNotice-mapper2.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int memNoticeCount(Connection conn) {
		// select문
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("memNoticeCount");
		
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
	
	
	
	// 공지사항 전체 조회
	public ArrayList<MemNotice> selectMemNoticeList(Connection conn, PageInfo pi){
		// select문 
		ArrayList<MemNotice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemNoticeList");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				list.add(new MemNotice(rset.getInt("notice_no"),
									   rset.getString("notice_title"),
									   rset.getString("admin_id"),
									   rset.getInt("notice_count"),
									   rset.getDate("create_date")));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int increaseCount(Connection conn, int noticeNo) {
		// update문
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public MemNotice selectMemNotice(Connection conn, int MemnoticeNo) {
		// select문
		MemNotice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, MemnoticeNo);
			
			rset = pstmt.executeQuery();
			
		if(rset.next()) {
			n = new MemNotice(rset.getInt("notice_no"),
							  rset.getString("notice_title"),
							  rset.getString("notice_content"),
							  rset.getString("admin_id"),
							  rset.getDate("create_date"));
		}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}
	
	
	
	
}
	
		
