package com.petnolja.memreserve.model.service;
import static com.petnolja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.common.Attachment;
import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.memreserve.model.dao.MemReserveDao;
import com.petnolja.memreserve.model.vo.MemReserve;
import com.petnolja.memreserve.model.vo.ReserveContent;
import com.petnolja.pet.model.vo.Pet;

public class MemReserveService {
	
	
	// 회원이 본인의 예약리스트를 조회할때 목록 갯수 뽑기
	public int reserveListCount(int userNo, String startDate, String endDate) {
		Connection conn = getConnection();
		int listCount = new MemReserveDao().reserveListCount(conn, userNo, startDate,endDate);

		close(conn);
		return listCount;

	}

	// 회원이 본인의 예약리스트를 조회할때 목록 뽑기
	public ArrayList<MemReserve> reserveList(int userNo, String startDate, String endDate, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<MemReserve> list = new MemReserveDao().reserveList(conn, userNo, startDate, endDate, pi);
		
		close(conn);
		return list;
		
		
	}
	
	//예약진행시 필요한 내용을 select합니다
	public ArrayList<ReserveContent> reserveProceed(int sitterNo, String petList, String careDay, String startDate, String endDate) {
		Connection conn = getConnection();
		ArrayList<ReserveContent> list = new MemReserveDao().reserveProceed(conn, sitterNo, petList, careDay, startDate, endDate);
		close(conn);
		
		return list;
	}
	
	// 예약진행 insert 기능입니다.
	public int reserveInsertAjax(int userNo, String checkin, String checkout, String requestInput, int payNo, String payMethod, int payAmount, String sittingNo, String petNo) {
		
		Connection conn = getConnection();
		int result1 = new MemReserveDao().reserveInsertAjax(conn, userNo, checkin, checkout, requestInput, payNo, payMethod, payAmount);
		int result2 = new MemReserveDao().reserveSittingInsertAjax(conn, sittingNo);
		int result3 = new MemReserveDao().reservePetInsertAjax(conn, petNo);
		int result= result1+result2+result3;

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	public String[] reviewReservInfo(long reserveNo) {
		Connection conn = getConnection();
		String[] arr = new MemReserveDao().reviewReservInfo(conn, reserveNo);
		close(conn);
		return arr;
		
	}
	
	
	// 리뷰작성 insert 기능입니다.
	public int reviewInsert(long reserveNo, int starCount, String comment, Attachment at) {
		Connection conn = getConnection();
		int result1 = new MemReserveDao().reviewInsert(conn, reserveNo, starCount, comment);
		int result2 = 1;
		if(at != null) {
			result2 = new MemReserveDao().reviewInsertAttachment(conn, at);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
	
	
	public MemReserve reserveListDetail(long reserveNo) {
		Connection conn = getConnection();
		MemReserve rc = new MemReserveDao().reserveListDetail(conn, reserveNo);
		close(conn);
		return rc;
		
	}
	
	public ArrayList<Pet> reserveListDetailPet(long reserveNo) {
		Connection conn = getConnection();
		ArrayList<Pet> plist = new MemReserveDao().reserveListDetailPet(conn,reserveNo);
		close(conn);
		return plist;
	}
	
	
	
	public int cancelReserve(long reserveNo, String cancelComment) {
		Connection conn = getConnection();
		int result = new MemReserveDao().cancelReserve(conn, reserveNo, cancelComment);
		
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
