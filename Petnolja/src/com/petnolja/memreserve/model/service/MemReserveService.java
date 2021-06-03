package com.petnolja.memreserve.model.service;
import static com.petnolja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.memreserve.model.dao.MemReserveDao;
import com.petnolja.memreserve.model.vo.MemReserve;
import com.petnolja.memreserve.model.vo.ReserveContent;

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
	
	public ArrayList<ReserveContent> reserveProceed(int sitterNo, String petList, String careDay, String startDate, String endDate) {
		Connection conn = getConnection();
		ArrayList<ReserveContent> list = new MemReserveDao().reserveProceed(conn, sitterNo, petList, careDay, startDate, endDate);
		close(conn);
		
		return list;
	}
	
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

}
