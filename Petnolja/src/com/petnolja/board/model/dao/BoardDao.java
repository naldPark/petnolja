package com.petnolja.board.model.dao;
import static com.petnolja.common.JDBCTemplate.*;

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


public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		try {
			prop.loadFromXML(new FileInputStream(ReportDao.class.getResource("/sql/board/board-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public int memFaqCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("memFaqCount");
		
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
	
	public ArrayList<MemNotice> faqList(Connection conn, PageInfo pi) {

		// select문 
				ArrayList<MemNotice> list = new ArrayList<>();
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				String sql = prop.getProperty("memSelectFaqList");
				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;
				
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
					
					rset = pstmt.executeQuery();
					
					
					while(rset.next()) {
						list.add(new MemNotice(rset.getInt("notice_no"),
											   rset.getString("notice_category"),
											   rset.getString("notice_title"),
											   rset.getString("notice_content")
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
	
	

}
