package com.petnolja.member.model.dao;

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
import com.petnolja.member.model.vo.FindMember;
import com.petnolja.member.model.vo.Member;
import com.petnolja.petsitter.model.vo.Sitter;


public class MemberDao {
	
private Properties prop = new Properties();

	public MemberDao() {
		
		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	// 회원 로그인
	public Member loginMember(Connection conn, String userId, String userPwd) {
		
		Member m = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("loginMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(
				rset.getInt("mem_no"),
				rset.getString("mem_id"),
				rset.getString("mem_name"),
				rset.getString("mem_pwd"),
				rset.getString("mem_tel"),
				rset.getString("mem_email"),
				rset.getString("mem_address"),
				rset.getString("mem_detail_address"),
				rset.getDouble("MEM_LATITUDE"),
				rset.getDouble("MEM_LONGTITUDE"),
				rset.getDate("mem_enrolldate"),
				rset.getString("mem_status"),
				rset.getDate("MEM_DEL_DATE"),
				rset.getString("MEM_DEL_DETAIL"),
				rset.getString("MEM_ADS"),
				rset.getString("MEM_BLOCK"),
				rset.getString("MEM_REPORT"),
				rset.getString("SITTER_ACCESS")		
				);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		
		return m;
		
	}
	
	// 회원 아이디 찾기 본인검증 및 찾아오기
	public String findId(Connection conn, Member m) {
		String findId = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("findId");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemName());
			pstmt.setString(2, m.getMemEmail());
			pstmt.setString(3, m.getMemTel());
			rset=pstmt.executeQuery();
			if(rset.next()){
				findId = rset.getString("MEM_ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return findId;
	
	}
	
	
	// 회원 비밀번호 재설정을 위한 본인 검증
	public FindMember findPwd1(Connection conn, String userId, String userName) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		FindMember m= null;
		
		String sql = prop.getProperty("findPwd1");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userName);
			rset = pstmt.executeQuery();
			if(rset.next()){
				m = new FindMember();
				m.setMemNo(rset.getInt("MEM_NO"));
				m.setMemId(rset.getString("MEM_ID"));
				m.setMemName(rset.getString("MEM_NAME"));
				m.setMemEmail(rset.getString("MEM_EMAIL"));
				m.setMemTel(rset.getString("MEM_TEL"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
		
	}
	

	// 회원 인증번호 검증을 위한 보관
		public int tempPwd(Connection conn, String userId, String tempPwd) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("tempPwd");
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, tempPwd);
				pstmt.setString(2, userId);
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
		
		// 회원 인증번호 검증
		public int authPwd(Connection conn, String userId, String authNo) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("authPwd");
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				pstmt.setString(2, authNo);
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
	
	
	
	// 회원 비밀번호 재설정
	public int findPwd2(Connection conn, String userPwd, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("findPwd2");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userPwd);
			pstmt.setString(2, userId);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 회원이 본인의 즐겨찾기를 조회할때 목록 갯수 뽑기
	public int favoriteListCount(Connection conn, int userNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("favoriteListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
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
	
	// 회원이 본인의 즐겨찾기를 조회
	public ArrayList<Sitter> favoriteList(Connection conn, PageInfo pi, int userNo){
		
		ArrayList<Sitter> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("favoriteList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Sitter(rset.getInt("SITTER_NO"),
									rset.getString("SITTER_TITLE"),
								    rset.getString("MEM_NAME"),
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
	
	public int favoriteChange(Connection conn, int userNo, int sitterNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("favoriteInsert");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, sitterNo);
			pstmt.setInt(3, userNo);
			pstmt.setInt(4, sitterNo);
			result = pstmt.executeUpdate();
			if (result == 0) {
				close(pstmt);
				sql = prop.getProperty("favoriteDelete");
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				pstmt.setInt(2, sitterNo);
				result = pstmt.executeUpdate() + 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	
	}
	
	// 회원가입 insert입니다
	public int insertMember(Connection conn, Member m) {
		// insert문
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemId());
			pstmt.setString(2, m.getMemName());
			pstmt.setString(3, m.getMemPwd());
			pstmt.setString(4, m.getMemTel());
			pstmt.setString(5, m.getMemEmail());
			pstmt.setString(6, m.getMemAddress());
			pstmt.setString(7, m.getMemDetailAddress());
			pstmt.setDouble(8, m.getMemLatitude());
			pstmt.setDouble(9, m.getMemLongtitude());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
		
	public int updateMember(Connection conn, Member m) {
		// update문
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemPwd());
			pstmt.setString(2, m.getMemTel());
			pstmt.setString(3, m.getMemEmail());
			pstmt.setString(4, m.getMemAddress());
			pstmt.setString(5, m.getMemDetailAddress());
			pstmt.setDouble(6, m.getMemLatitude());
			pstmt.setDouble(7, m.getMemLongtitude());
			pstmt.setInt(8, m.getMemNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt); //사용 다했으니까 반납
		}
		
		return result; // 완성했으니까 서비스 단으로 반환
	}
	
	public Member selectMember(Connection conn, int memNo) {
		// select문
		Member updateMem = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);

			rset = pstmt.executeQuery();
			
		if(rset.next()) {
			updateMem = new Member(rset.getInt("mem_no"),
								   rset.getString("mem_id"),
								   rset.getString("mem_name"),
								   rset.getString("mem_pwd"),
								   rset.getString("mem_tel"),
								   rset.getString("mem_email"),
								   rset.getString("mem_address"),
								   rset.getString("mem_detail_address"),
								   rset.getDouble("mem_latitude"),
								   rset.getDouble("mem_longtitude"));
		}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return updateMem;
	}
	
	public int leaveMember(Connection conn, String checkbox, String memId, String memPwd) {
		// update문
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("leaveMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkbox);
			pstmt.setString(2, memId);
			pstmt.setString(3, memPwd);
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/** 최서경
	 * @return 총 회원수 조회
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
	 * @return 총 회원 목록 조회
	 */
	public ArrayList<Member> selectList(Connection conn, PageInfo pi){
		
		int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("MEM_NO"),
									rset.getString("MEM_ID"),
									rset.getString("MEM_NAME"),
									rset.getString("MEM_TEL"),
									rset.getString("MEM_EMAIL"),
									rset.getString("MEM_ADDRESS"),
									rset.getString("MEM_BLOCK")));
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
	 * 관리자페이지에서 회원정보 수정
	 */
	public int adminUpdateMember(Connection conn, int memNo, String updateCol, String updateVal) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "";
		
        switch (updateCol) {
        case "MEM_ID": sql = prop.getProperty("adminUpdateMemberId"); break;
        case "MEM_NAME": sql = prop.getProperty("adminUpdateMemberName"); break;
        case "MEM_TEL": sql = prop.getProperty("adminUpdateMemberTel"); break;
        case "MEM_EMAIL": sql = prop.getProperty("adminUpdateMemberEmail"); break;
        case "MEM_ADDRESS": sql = prop.getProperty("adminUpdateMemberAddress"); break;
    }

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updateVal);
			pstmt.setInt(2, memNo);
			result = pstmt.executeUpdate();
			
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
			}
			
			return result;
			
		}
		
		/** 최서경
		 * 괸리자 회원 블랙리스트 등록(방법1. for문 방법)
		 */
		public int blockMember(Connection conn, String[] list) {
			
			
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("blockMember");
			
			try {
				
				int num = 0;
				pstmt = conn.prepareStatement(sql);
				
				for(int i=0; i < list.length; i++) {
					
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
		
		/** 최서경
		 * 괸리자 회원 블랙리스트 해제 (방법2. 동적 sql방법)
		 */
		public int unblockMember(Connection conn, String[] list) {
			
			
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("unblockMember");
			
			sql += "WHERE MEM_NO IN (" + String.join(",", list) + ")";
			
			try {
				
				pstmt = conn.prepareStatement(sql);
				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
		/** 최서경
		 * 관리자 회원 삭제
		 */
		public int adminDeleteMember(Connection conn, String[] list) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("adminDeleteMember");
			
			sql += "WHERE MEM_NO IN (" + String.join(",", list) + ")";
			
			try {
				pstmt = conn.prepareStatement(sql);
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
		
		
	}

	
	

