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


public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		try {
			prop.loadFromXML(new FileInputStream(ReportDao.class.getResource("/sql/board/board-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public ArrayList<MemNotice> faqList(Connection conn) {

		// select문 
				ArrayList<MemNotice> list = new ArrayList<>();
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				String sql = prop.getProperty("memSelectFaqList");

				try {
					pstmt = conn.prepareStatement(sql);		
					rset = pstmt.executeQuery();
					
					
					while(rset.next()) {
						list.add(new MemNotice(rset.getInt("RNUM"),
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
