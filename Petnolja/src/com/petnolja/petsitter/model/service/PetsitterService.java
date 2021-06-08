package com.petnolja.petsitter.model.service;

import static com.petnolja.common.JDBCTemplate.close;
import static com.petnolja.common.JDBCTemplate.commit;
import static com.petnolja.common.JDBCTemplate.getConnection;
import static com.petnolja.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.admin.model.vo.Calculate;
import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.pet.model.vo.Log;
import com.petnolja.pet.model.vo.Pet;
import com.petnolja.petsitter.model.dao.PetsitterDao;
import com.petnolja.petsitter.model.vo.Account;
import com.petnolja.petsitter.model.vo.Detail;
import com.petnolja.petsitter.model.vo.Petsitter;
import com.petnolja.petsitter.model.vo.Reserv;
import com.petnolja.qna.model.vo.Qna;

public class PetsitterService {

	// 기존 펫시터 리스트 카운트
	public int selectOldListCount() {
		
		Connection conn = getConnection();
		int listCount = new PetsitterDao().selectOldListCount(conn);
		
		close(conn);
		return listCount;
		
	}
	
	public int selectOldListCount(String keyword) {
		
		Connection conn = getConnection();
		int listCount = new PetsitterDao().selectOldListCount(conn, keyword);
		
		close(conn);
		return listCount;
		
	}
	
	// 새로운 펫시터 리스트 카운트
	public int selectNewListCount() {
		
		Connection conn = getConnection();
		int listCount = new PetsitterDao().selectNewListCount(conn);
		
		close(conn);
		return listCount;
		
	}
	
	// 기존 펫시터 리스트
	public ArrayList<Petsitter> selectOldPetsitterList(PageInfo pi){
		
		Connection conn = getConnection();
		ArrayList<Petsitter> list = new PetsitterDao().selectOldPetsitterList(conn, pi);
		
		close(conn);
		return list;
		
	}
	
	public ArrayList<Petsitter> selectOldPetsitterList(PageInfo pi, String keyword){
		
		Connection conn = getConnection();
		ArrayList<Petsitter> list = new PetsitterDao().selectOldPetsitterList(conn, pi, keyword);
		
		close(conn);
		return list;
		
	}
	
	// 새로운 펫시터 리스트
	public ArrayList<Petsitter> selectNewPetsitterList(PageInfo pi){
		
		Connection conn = getConnection();
		ArrayList<Petsitter> list = new PetsitterDao().selectNewPetsitterList(conn, pi);
		
		close(conn);
		return list;
	}
	
	// 지원서 상세내용
	public Petsitter selectNewPetsitter(int sitterNo) {
		Connection conn = getConnection();
		Petsitter p = new PetsitterDao().selectNewPetsitter(conn, sitterNo);
		close(conn);
		return p;		
	}
	
	
	//기존 펫시터 삭제
	public int blockSitter(String[] list) {
		Connection conn = getConnection();
		int result = new PetsitterDao().blockSitter(conn, list);

		if (result == list.length) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	// 기존 펫시터 정보 업데이트
	public int updateOldSitter(int sitterNo, String updateCol, String updateVal) {
		Connection conn = getConnection();

		int result = new PetsitterDao().updateOldSitter(conn, sitterNo, updateCol, updateVal);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	public int sitterAccept(int sitterNo) {
		
		Connection conn = getConnection();

		int result = new PetsitterDao().sitterAccept(conn, sitterNo);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int sitterDeny(int sitterNo) {
		
		Connection conn = getConnection();

		int result = new PetsitterDao().sitterDeny(conn, sitterNo);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	public int insertSitterMoney(int sitterNo, int bakSmall, int daySmall, int bakMid, int dayMid, int bakBig, int dayBig) {
		Connection conn = getConnection();  // 컴퓨터 킬게요
		int result = new PetsitterDao().insertSitterMoney(conn, sitterNo, bakSmall, daySmall, bakMid, dayMid, bakBig, dayBig);
		// dao로 애들을 데리고 가자
		
		//=======================돌아오는길
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
		
	}
	public int stopSitter(int userNo, String stopradio, String deReason) {
		Connection conn = getConnection();
		int result = new PetsitterDao().stopSitter(conn, userNo, stopradio, deReason);
		
		
		if (result > 0) {
			commit(conn);	
			
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int addService(int userNo, String checkbox) {
		Connection conn = getConnection();
		int result = new PetsitterDao().addService(conn, userNo ,checkbox);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}

	public int selectQna(int userNo, int qnaNo, String qTitle, String qContent, String qCtrateDate, String aWriter) {
		Connection conn = getConnection();
		int result = new PetsitterDao().selectQna(conn, userNo, qnaNo, qTitle, qContent, qCtrateDate, aWriter);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int updateReject(int userNo, int resNo, String resStat, String cancelRea) {
	
		Connection conn = getConnection();
		int result = new PetsitterDao().updateReject(conn, userNo, resNo, resStat, cancelRea);
	
		if (result > 0) {
			commit(conn);	
			
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public ArrayList<Qna> selectHist(int userNo) {
		
		Connection conn = getConnection();
		ArrayList<Qna> list = new PetsitterDao().selectHist(conn, userNo);
		
		close(conn);
		
		return list;
	}
	public ArrayList<Log> selectDaily(int userNo) {
		
		Connection conn = getConnection();
		ArrayList<Log> list = new PetsitterDao().selectDaily(conn, userNo);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Reserv> selectVation(int userNo) {
	
		Connection conn = getConnection();
		ArrayList<Reserv> list = new PetsitterDao().selectVation(conn, userNo);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Reserv> selectRequest(int userNo) {
		
		Connection conn = getConnection();
		ArrayList<Reserv> list = new PetsitterDao().selectRequest(conn, userNo);
		
		close(conn);
		
		return list;
	}
	

	
	public Detail selectDetail(long resNo) {
		
		Connection conn = getConnection();
		Detail d = new PetsitterDao().selectDetail(conn, resNo);
		
		close(conn);
		
		return d;
	}
	
	public Pet selectPetDetail(int petNo) {
		
		Connection conn = getConnection();
		Pet p = new PetsitterDao().selectPetDetail(conn, petNo);
		
		close(conn);
		
		return p;
	
	}
	public Detail selectConfi(long resNo) {
		
		Connection conn = getConnection();
		Detail b = new PetsitterDao().selectConfi(conn, resNo);
		
		close(conn);
		return b;
	}
	public int updateConfi(long resNo ) {
		Connection conn = getConnection();
		int result = new PetsitterDao().updateConfi(conn, resNo);
		
		
		if (result > 0) {
			commit(conn);	
			
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int updateCancel(long resNo ) {
		Connection conn = getConnection();
		int result = new PetsitterDao().updateCancel(conn, resNo);
		
		
		if (result > 0) {
			commit(conn);	
			
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	/** 최서경
	 * 이번달 정산금액 조회
	 */
	public Calculate selectNowCal(String memId) {
		Connection conn = getConnection();
		
		Calculate c = new PetsitterDao().selectNowCal(conn, memId);
		
		close(conn);
		
		return c;
	}
	
	/** 최서경
	 * 펫시터 정산내역 추가 조회
	 */
	public ArrayList<Calculate> selectCalList(String memId) {
		Connection conn = getConnection();
		
		ArrayList<Calculate> list = new PetsitterDao().selectCalList(conn, memId);
		
		close(conn);
		return list;
	}
	
	/** 최서경
	 * 펫시터 정산내역 날짜로 검색
	 */
	public ArrayList<Calculate> selectCalList(String memId, String date) {
		Connection conn = getConnection();
		
		ArrayList<Calculate> list = new PetsitterDao().selectCalList(conn, memId, date);
		
		close(conn);
		return list;

	}
	
	/** 최서경
	 * 펫시터 정산계좌관리-> 대표계좌 은행명, 끝 4자리 번호
	 */
	public Account getRepAcc(int memNo) {
		Connection conn = getConnection();
		
		Account repAcc = new PetsitterDao().getRepAcc(conn, memNo);
		
		close(conn);
		return repAcc;
	}
	
	/** 최서경
	 * 펫시터 계좌 목록 조회
	 */
	public ArrayList<Account> selectAccList(int memNo){
		Connection conn = getConnection();
		
		ArrayList<Account> list = new PetsitterDao().selectAccList(conn, memNo);
		
		close(conn);
		return list;
	}
	
	/** 최서경
	 * 펫시터 계좌 삭제
	 */
	public int deleteAccount(int accno) {
		Connection conn = getConnection();
		
		int result = new PetsitterDao().deleteAccount(conn, accno);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	/** 최서경
	 * 대표계좌 지정
	 */
	public int representAccount(int accno) {
		Connection conn = getConnection();
		
		int result1 = new PetsitterDao().deleteRepresentAccount(conn);
		int result2 = new PetsitterDao().representAccount(conn, accno);
		
		int result = result1 * result2;
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	/** 최서경
	 * 새로운 계좌 추가
	 */
	public int insertAccount(Account a) {
		Connection conn = getConnection();
		
		int result = new PetsitterDao().insertAccount(conn, a);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
	

