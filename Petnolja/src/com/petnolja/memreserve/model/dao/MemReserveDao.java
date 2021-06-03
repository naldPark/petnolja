package com.petnolja.memreserve.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.petnolja.memreserve.model.vo.ReserveContent;
import com.petnolja.common.Attachment;
import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.memreserve.model.vo.MemReserve;

import static com.petnolja.common.JDBCTemplate.*;

public class MemReserveDao {
	
	
	private Properties prop = new Properties();

	public MemReserveDao() {

		String fileName = MemReserveDao.class.getResource("/sql/memreserve/memreserve-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	// 회원이 본인의 예약리스트를 조회할때 목록 갯수 뽑기
		public int reserveListCount(Connection conn, int userNo, String startDate, String endDate) {
			int listCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("reserveListCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				pstmt.setString(2, startDate);
				pstmt.setString(3, endDate);
				pstmt.setString(4, startDate);
				pstmt.setString(5, endDate);
				
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
	
	
	
	// 회원이 본인의 예약리스트를 조회할때 목록 뽑기
	public ArrayList<MemReserve> reserveList(Connection conn, int userNo, String startDate, String endDate, PageInfo pi) {
		ArrayList<MemReserve> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reserveList");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			pstmt.setString(4, startDate);
			pstmt.setString(5, endDate);
			pstmt.setInt(6, startRow);
			pstmt.setInt(7, endRow);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				list.add(new MemReserve(
						rset.getInt("SITTER_NO"),
						rset.getString("SITTER_TITLE"),
						rset.getString("MEM_NAME"),
					    rset.getLong("RES_NO"),
					    rset.getDate("RES_DATE"),
					    rset.getString("RES_CHECKIN"),
					    rset.getString("RES_CHECKOUT"),
					    rset.getString("RES_STATUS"),
						rset.getString("CANCEL_REASON"),
						rset.getString("RES_STATUS"),
						rset.getString("PATH")));
					    }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	
	}
	
	
	
	public ArrayList<ReserveContent> reserveProceed(Connection conn, int sitterNo, String petList, String careDay, String startDate, String endDate) {
		ArrayList<ReserveContent> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reserveProceed");
		sql+="WHERE P.PET_NO IN ("+petList+") AND S.SITTER_NO=? AND PET_CARE =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sitterNo);
			pstmt.setString(2, careDay);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				list.add(new ReserveContent(
						rset.getInt("PET_NO"),
						rset.getInt("MEM_NO"),
						rset.getInt("SITTER_NO"),
						rset.getInt("SITTING_NO"),
						rset.getString("SITTER_NAME"),
						rset.getString("PET_NAME"),
					    rset.getString("PET_BIRTH"),
					    rset.getString("PET_SIZE"),
					    rset.getString("PET_GENDER"),
					    startDate,
					    endDate,
						rset.getInt("SITTER_CHECKIN"),
						rset.getInt("SITTER_CHECKOUT"),
						rset.getInt("FEE"),
						rset.getString("PET_IMG")						
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
	
	
	public int reserveInsertAjax(Connection conn, int userNo, String checkin, String checkout, String requestInput,
			int payNo, String payMethod, int payAmount) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reserveInsertAjax");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, checkin);
			pstmt.setString(3, checkout);
			pstmt.setString(4, requestInput);
			pstmt.setInt(5, payNo);
			pstmt.setString(6, payMethod);
			pstmt.setInt(7, payAmount);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public int reserveSittingInsertAjax(Connection conn, String sittingNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT ALL ";
		String[] sittingNoAry = sittingNo.split(",");
		for (int i = 0; i < sittingNoAry.length; i++) {
		 sql+="INTO RESERV_SITTING VALUES(SEQ_RESNO.CURRVAL,?)";
		}
		 sql+= " SELECT * FROM DUAL";
		try {
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < sittingNoAry.length; i++) {
				pstmt.setString(i+1, sittingNoAry[i]);
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int reservePetInsertAjax(Connection conn, String petNo) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT ALL ";
		String[] petNoAry = petNo.split(",");
		for (int i = 0; i < petNoAry.length; i++) {
		 sql+="INTO RESERV_PET VALUES(SEQ_RESNO.CURRVAL,?)";
		}
		 sql+= " SELECT * FROM DUAL";
		try {
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < petNoAry.length; i++) {
				pstmt.setString(i+1, petNoAry[i]);
			}
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int reviewInsert(Connection conn, long reserveNo, int starCount, String comment) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reviewInsert");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, reserveNo);
			pstmt.setInt(2, starCount);
			pstmt.setString(3, comment);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result; 
	}
	
	public int reviewInsertAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reviewInsertAttachment");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	
}
