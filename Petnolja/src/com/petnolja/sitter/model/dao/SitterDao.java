package com.petnolja.sitter.model.dao;

import static com.petnolja.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.petnolja.common.Attachment;
import com.petnolja.petsitter.model.vo.Petsitter;
import com.petnolja.research.model.vo.Research;

public class SitterDao {
	
	private Properties prop = new Properties();
	
	public SitterDao() {
		
		String fileName = SitterDao.class.getResource("/sql/sitter/sitter-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int applySitterInsert(Connection conn, Petsitter s) {
		int result= 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("applySitterInsert");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s.getSitterNo());
			pstmt.setString(2, s.getPetPeriod());
			pstmt.setString(3, s.getPetNo());
			pstmt.setString(4, s.getLicense());
			pstmt.setString(5, s.getExperience());
			pstmt.setString(6, s.getMotive());
			pstmt.setString(7, s.getAddContent());
			result = pstmt.executeUpdate();
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	public Research selectCurrentOptions(Connection conn, int userNo) {
		Research r = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectCurrentOptions");
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
		if(rset.next()) {
			r = new Research(rset.getInt("Mem_no"),
							rset.getString("Mem_name"),
							rset.getString("sitter_title"),
							rset.getString("additions")	,
				   		    String.format("%,d",rset.getInt("OSMALL")),
						    String.format("%,d",rset.getInt("OMID")),
						    String.format("%,d",rset.getInt("OBIG")),
						    String.format("%,d",rset.getInt("DSMALL")),
						    String.format("%,d",rset.getInt("DMID")),
						    String.format("%,d",rset.getInt("DBIG"))
							  );
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;
		
	}
	
	
	public int reserveWaitingCount(Connection conn, int userNo) {
		int count = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("sitterWaitingCount");
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
		if(rset.next()) {
			count = rset.getInt("count");
		}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	
	public int reserveConfirmCount(Connection conn, int userNo) {
		int count = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("sitterConfirmCount");
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
		if(rset.next()) {
			count = rset.getInt("count");
		}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	//날드 ... 펫시터 프로필 제목 내용....업데이트.....인데..넣습니다
	public int sitterContentUpdate(Connection conn, int userNo, String title, String selfInfo) {
		
		int result= 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("sitterContentUpdate");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, selfInfo);
			pstmt.setInt(3, userNo);
			result = pstmt.executeUpdate();
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
		//날드 ...... 펫시터 사진......넣습니다
	public int insertAttachmentList(Connection conn, int userNo, ArrayList<Attachment> at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachmentList");
		try {
			
			for(int i = 0; i < at.size(); i++) {
				if(!at.get(i).getStatus().equals("N")) {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, userNo);
					pstmt.setString(2, at.get(i).getOriginName());
					pstmt.setString(3, at.get(i).getChangeName());
					pstmt.setString(4, at.get(i).getFilePath());
					pstmt.setInt(5, at.get(i).getFileLevel());
	
					result = pstmt.executeUpdate();
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	//날드 ...... 펫시터 프로필 불러옵.....니다
	public Petsitter selectSitterContent(Connection conn, int userNo) {
		Petsitter ps = new Petsitter();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectSitterContent");
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
		if(rset.next()) {
			ps.setSitterNo(rset.getInt("SITTER_NO"));
			ps.setSitterTitle(rset.getString("SITTER_TITLE"));
			ps.setSitterContent(rset.getString("SITTER_TITLE"));
		}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ps;
		
	}
	
	//날드 ...... 펫시터사진 불러옵.....니다
		public String[] selectSitterPics(Connection conn, int userNo) {
			String[] pics = new String[8];		
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("selectSitterPics");
			ResultSet rset = null;
			int i= 0;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				rset = pstmt.executeQuery();			
				while(rset.next()) {
					pics[i]= rset.getString("file_level");
					pics[i+1]= rset.getString("path");
					i=i+2;
					}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return pics;
			
		}
		
		
		//날드 ...... 펫시터 사진 업데이트합니다
		public int updateAttachmentList(Connection conn, int userNo, ArrayList<Attachment> at) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("updateAttachmentList");
			try {

				for (int i = 0; i < at.size(); i++) {
					if (!at.get(i).getStatus().equals("Y")) {
						pstmt = conn.prepareStatement(sql);

						pstmt.setString(1, at.get(i).getOriginName());
						pstmt.setString(2, at.get(i).getChangeName());
						pstmt.setString(3, at.get(i).getFilePath());
						pstmt.setInt(4, at.get(i).getFileLevel());
						pstmt.setInt(5, userNo);
						pstmt.setInt(6, at.get(i).getFileLevel());

						result = pstmt.executeUpdate();

					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

			return result;

		}
		
		
	
}
	

