package com.petnolja.memboard.model.dao;

import static com.petnolja.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.petnolja.common.model.vo.PageInfo;
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
}
