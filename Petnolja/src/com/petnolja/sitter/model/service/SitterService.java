package com.petnolja.sitter.model.service;

import static com.petnolja.common.JDBCTemplate.close;
import static com.petnolja.common.JDBCTemplate.commit;
import static com.petnolja.common.JDBCTemplate.getConnection;
import static com.petnolja.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.petnolja.petsitter.model.vo.Petsitter;
import com.petnolja.research.model.vo.Research;
import com.petnolja.sitter.model.dao.SitterDao;

public class SitterService {
	
	public int applySitterInsert(Petsitter s) {
		Connection conn = getConnection();
		int result = new SitterDao().applySitterInsert(conn, s);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;

	}
	
	public Research selectCurrentOptions(int userNo) {
		Connection conn = getConnection();
		
		Research r =new SitterDao().selectCurrentOptions(conn, userNo);

		close(conn);
		return r;
	}
	
	public int[] selectReserveList(int userNo) {
		Connection conn = getConnection();
		int waiting =new SitterDao().reserveWaitingCount(conn, userNo);
		int confirm  =new SitterDao().reserveConfirmCount(conn, userNo);

		int[] count = {waiting, confirm};
		close(conn);
		
		return count;


	}


	
	
}
	

