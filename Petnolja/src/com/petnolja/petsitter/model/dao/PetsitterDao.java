package com.petnolja.petsitter.model.dao;

import static com.petnolja.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.petnolja.admin.model.vo.Calculate;
import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.pet.model.vo.Log;
import com.petnolja.petsitter.model.vo.*;
import com.petnolja.qna.model.vo.Qna;

public class PetsitterDao {
	
	private Properties prop = new Properties();
	
	public PetsitterDao() {
		
		String fileName = PetsitterDao.class.getResource("/sql/petsitter/petsitter-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int selectOldListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOldListCount");
		
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
	
	public int selectOldListCount(Connection conn, String keyword) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectKeyOldListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
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
	
	public int selectNewListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNewListCount");
		
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
	
	
	public ArrayList<Petsitter> selectOldPetsitterList(Connection conn, PageInfo pi){
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		ArrayList<Petsitter> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOldPetsitterList");
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Petsitter(rset.getString("mem_id"),
									rset.getInt("sitter_no"),
									rset.getString("sitter_access").charAt(0),
									rset.getString("pet_period"),
									rset.getString("pet_no"),
									rset.getString("license"),
									rset.getString("experience"),
									rset.getString("motive"),
									rset.getString("promotion_status").charAt(0),
									rset.getDate("promotion_date"),
									rset.getString("stop_reason"),
									rset.getString("stop_content"),
									rset.getInt("penalty_count"),
									rset.getString("additions"),
									rset.getInt("duration")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	
	public ArrayList<Petsitter> selectOldPetsitterList(Connection conn, PageInfo pi, String keyword){
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		ArrayList<Petsitter> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectKeyOldPetsitter");
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Petsitter(rset.getString("mem_id"),
									rset.getInt("sitter_no"),
									rset.getString("sitter_access").charAt(0),
									rset.getString("pet_period"),
									rset.getString("pet_no"),
									rset.getString("license"),
									rset.getString("experience"),
									rset.getString("motive"),
									rset.getString("promotion_status").charAt(0),
									rset.getDate("promotion_date"),
									rset.getString("stop_reason"),
									rset.getString("stop_content"),
									rset.getInt("penalty_count"),
									rset.getString("additions"),
									rset.getInt("duration")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	
	public ArrayList<Petsitter> selectNewPetsitterList(Connection conn, PageInfo pi){
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		ArrayList<Petsitter> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNewPetsitterList");
	
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Petsitter(rset.getString("mem_id"),
									rset.getInt("sitter_no"),
									rset.getString("sitter_access").charAt(0),
									rset.getString("pet_period"),
									rset.getString("pet_no"),
									rset.getString("license"),
									rset.getString("experience"),
									rset.getString("promotion_status").charAt(0),
									rset.getDate("promotion_date"),
									rset.getString("additions")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public Petsitter selectNewPetsitter(Connection conn, int sitterNo) {
		// select문 => ResultSet객체 (한행)
		Petsitter p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNewPetsitter");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sitterNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Petsitter(rset.getInt("sitter_no"),
								rset.getString("mem_id"),
								rset.getString("pet_period"),
								rset.getString("pet_no"),
								rset.getString("license"),
								rset.getString("experience"),
								rset.getString("motive"),
								rset.getString("add_content"),
								rset.getString("additions"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
		
	}

	public int blockSitter(Connection conn, String[] list) {
		
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("blockSitter");
		
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
	
	public int updateOldSitter(Connection conn, int sitterNo, String updateCol, String updateVal) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "";
		
        switch (updateCol) {
        case "MEM_ID": sql = prop.getProperty("updateMemberId"); break;
        case "PET_NO": sql = prop.getProperty("updatePetNo"); break;
        case "ADDITIONS": sql = prop.getProperty("updateAdditions"); break;
        case "LICENSE": sql = prop.getProperty("updateLicense"); break;
        case "EXPERIENCE": sql = prop.getProperty("updateExperience"); break;
    }

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updateVal);
			pstmt.setInt(2, sitterNo);
			result = pstmt.executeUpdate();
			
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
			
	}
	
	
	public int sitterAccept(Connection conn, int sitterNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("sitterAccept");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sitterNo);
			result = pstmt.executeUpdate();
			
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;	
	}
	
	public int sitterDeny(Connection conn, int sitterNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("sitterDeny");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sitterNo);
			result = pstmt.executeUpdate();
			
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;	
	}	
	
	public int insertSitterMoney(Connection conn,int sitterNo, int bakSmall, int daySmall, int bakMid, int dayMid, int bakBig, int dayBig) {
		int result = 0;   // 그냥 결과가 1인지 0인지 성공인지 실패인지 이따가 넣으라고.. 만들어 놓음
		PreparedStatement pstmt = null;   // 컴퓨터의 프로그램 실행을 할건데 ?에 알맞은 값을 넣겠다
		String sql = prop.getProperty("insertSitterMoney"); // 실행할 명령문
		
		try {
			pstmt = conn.prepareStatement(sql); // 오라클 열고 준비 
			pstmt.setInt(1, sitterNo);
			pstmt.setInt(2, daySmall);
			pstmt.setInt(3, sitterNo);
			pstmt.setInt(4, dayMid);
			pstmt.setInt(5, sitterNo);
			pstmt.setInt(6, dayBig);
			pstmt.setInt(7, sitterNo);
			pstmt.setInt(8, bakSmall);
			pstmt.setInt(9, sitterNo);
			pstmt.setInt(10, bakMid);
			pstmt.setInt(11, sitterNo);
			pstmt.setInt(12, bakBig);
			result = pstmt.executeUpdate(); // 오라클에서 sql문 실행 
			// 성공하면 result 1 , 실패하면 0 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		return result;
		
		
	}
	public int stopSitter(Connection conn , int userNo, String stopradio, String deReason) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("stopSitter");
		
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, stopradio);
				pstmt.setString(2, deReason);
				pstmt.setInt(3, userNo);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
		}

	public int addService(Connection conn,int userNo, String checkbox) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("addService");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkbox);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int selectQna(Connection conn, int userNo, int qnaNo, String qTitle, String qContent, String qCtrateDate,
			String aWriter) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int updateReject(Connection conn, int userNo, int resNo, String resStat, String cancelRea) {
	
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReject");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cancelRea);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public ArrayList<Qna> selectHist(Connection conn, int userNo) {
		
		ArrayList<Qna> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHist");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Qna(rset.getInt("QNA_NO"),
									rset.getString("MEM_NAME"),
									rset.getString("Q_TITLE"),
									rset.getString("Q_MEM_NO"),
									rset.getDate("Q_CREATE_DATE")
									));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	public ArrayList<Log> selectDaily(Connection conn, int userNo) {
		
		ArrayList<Log> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDaily");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Log(rset.getInt("LOG_NO"),
									rset.getString("RES_DATE"),
									rset.getDate("LOG_TIME"),
									rset.getLong("RES_NO")
									
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
	public ArrayList<Reserv> selectVation(Connection conn, int userNo) {
		
		System.out.println("여기는 다오");
		ArrayList<Reserv> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectVation");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Reserv(rset.getInt("MEM_NO"),
									rset.getString("RES_STATUS"),
									rset.getString("MEM_NAME"),
									rset.getString("MEM_TEL"),
									rset.getLong("RES_NO"),
									rset.getString("RES_CHECKIN"),
									rset.getString("RES_CHECKOUT"),
									rset.getString("REQUEST")
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
	
		public ArrayList<Reserv> selectRequest(Connection conn, int userNo) {
		
		
		ArrayList<Reserv> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRequest");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Reserv(rset.getInt("MEM_NO"),
									rset.getString("RES_STATUS"),
									rset.getString("MEM_NAME"),
									rset.getString("MEM_TEL"),
									rset.getLong("RES_NO"),
									rset.getString("RES_CHECKIN"),
									rset.getString("RES_CHECKOUT"),
									rset.getString("REQUEST")
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
		
		public Detail selectDetail(Connection conn, int nNo) {
			
			Detail d = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectDetail");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, nNo);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					d = new Detail(rset.getInt("MEM_NO"),
										rset.getString("RES_STATUS"),
										rset.getLong("RES_NO"),
										rset.getString("MEM_NAME"),
										rset.getString("MEM_TEL"),
										rset.getString("RES_CHECKIN"),
										rset.getString("RES_CHECKOUT"),
										rset.getString("PET_NAME"),
										rset.getString("REQUEST")
										);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return d; 
		}	
		
		
		
		/** 최서경
		 * 이번달 정산금액 조회
		 */
		public Calculate selectNowCal(Connection conn, String memId) {
			Calculate c = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectNowCal");
			
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memId);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					c = new Calculate(rset.getString("year")
									, rset.getString("month")
									, rset.getLong("total"));
				}
						
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return c;
		}
		
		
		/** 최서경
		 * 펫시터 정산내역 추가 조회
		 */
		public ArrayList<Calculate> selectCalList(Connection conn, String memId){
			ArrayList<Calculate> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectCalList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memId);
				
				rset = pstmt.executeQuery();
				while(rset.next()) {
					list.add(new Calculate(rset.getString("year")
										 , rset.getString("month")
										 , rset.getLong("total")));
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
		 * 펫시터 정산내역 날짜로 검색
		 */
		public ArrayList<Calculate> selectCalList(Connection conn, String memId, String date){
			
			String searchYear = date.substring(0, 4);
			String searchMonth = date.substring(5);
			
			//System.out.println(searchYear);
			//System.out.println(searchMonth);
			
			ArrayList<Calculate> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectKeyCal");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memId);
				pstmt.setString(2, searchYear);
				pstmt.setString(3, searchMonth);
				
				rset = pstmt.executeQuery();
				while(rset.next()) {
					list.add(new Calculate(rset.getString("year")
										 , rset.getString("month")
										 , rset.getLong("total")));
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
		 * 펫시터 정산계좌관리-> 대표계좌 은행명, 끝 4자리 번호
		 */
		public Account getRepAcc(Connection conn, int memNo) {
			Account repAcc = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("getRepAcc");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, memNo);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					repAcc = new Account();
					repAcc.setAccBank(rset.getString("acc_bank"));
					repAcc.setAccNumber(rset.getString("acc_number"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return repAcc;
		}
		
		/** 최서경
		 * 펫시터 계좌 목록 조회
		 */
		public ArrayList<Account> selectAccList(Connection conn, int memNo){
			ArrayList<Account> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectAccList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, memNo);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Account( rset.getInt("acc_no")
									   , rset.getString("acc_bank")
							 		   , rset.getString("acc_number")
							 		   , rset.getString("acc_represent")));
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
		 *  계좌 삭제
		 */
		public int deleteAccount(Connection conn, int accno) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("deleteAccount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, accno);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
		
		/** 최서경
		 * 대표계좌 지정 1-> 새로운 대표계좌 지정
		 */
		public int representAccount(Connection conn, int accno) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("representAccount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, accno);
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
		/** 최서경
		 * 대표계좌 지정2 -> 기존 대표계좌 삭재
		 */
		public int deleteRepresentAccount(Connection conn) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("deleteRepresentAccount");
			
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
		 * 새로운 계좌 추가
		 */
		public int insertAccount(Connection conn, Account a) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertAccount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, a.getSitterNo());
				pstmt.setString(2, a.getAccBank());
				pstmt.setString(3, a.getAccNumber());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
}
	

