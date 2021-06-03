package com.petnolja.qna.model.dao;

import static com.petnolja.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.petnolja.common.Attachment;
import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.qna.model.vo.Qna;

/**
 * @author ysl38
 *
 */
public class QnaDao {
	
	private Properties prop = new Properties();

	public QnaDao() {
		
		String fileName = QnaDao.class.getResource("/sql/qna/qna-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/** 최서경
	 * 관리자 qna 총 개수 조회(페이징바에 사용)
	 */
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
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
	
	/** 최서경
	 * 관리자 qna목록 전체 조회
	 */
	public ArrayList<Qna> selectList(Connection conn, PageInfo pi){
		int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() -1;
		
		ArrayList<Qna> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Qna(rset.getInt("qna_no")
							   , rset.getString("mem_id")
							   , rset.getString("q_category")
							   , rset.getString("q_title")
							   , rset.getDate("q_create_date")
							   , rset.getString("a_content")
							   , rset.getString("admin_id")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/** 최서경
	 * qna 삭제
	 */
	public int deleteQna(Connection conn, String[] list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteQna");
		
		String qnoList = String.join(",", list);
		sql += "WHERE QNA_NO IN(" + qnoList + ")";
		
		try {
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	/** 최서경
	 * qna번호로 내용 조회
	 */
	public Qna selectQna(Connection conn, int qno) {
		Qna q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new Qna(rset.getInt("qna_no")
						  , rset.getString("mem_id")
						  , rset.getString("q_title")
						  , rset.getString("q_content")
						  , rset.getString("a_content")
						  , rset.getString("admin_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return q;
	}
	
	/** 최서경
	 * qna에 첨부된 파일 조회
	 */
	public Attachment selectAttachment(Connection conn, int qno) {
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				at = new Attachment(rset.getInt("file_no")
								  , rset.getString("origin_name")
								  , rset.getString("change_name")
								  , rset.getString("file_path"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return at;
	}

	public int updateAnswer(Connection conn, Qna q) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getaContent());
			pstmt.setInt(2, Integer.parseInt(q.getaWriter()));
			pstmt.setInt(3, q.getQnaNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
