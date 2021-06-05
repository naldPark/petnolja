package com.petnolja.memboard.model.service;

import static com.petnolja.common.JDBCTemplate.close;
import static com.petnolja.common.JDBCTemplate.commit;
import static com.petnolja.common.JDBCTemplate.getConnection;
import static com.petnolja.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.memboard.model.dao.MemBoardDao;
import com.petnolja.memboard.model.vo.MemBoard;
import com.petnolja.qna.model.vo.Qna;


public class MemBoardService {
	
	
	public int askToAdminListCount(int userNo) {
		Connection conn = getConnection();
		
		int listCount = new MemBoardDao().askToAdminListCount(conn, userNo);
		
		close(conn);
		
		return listCount;
	}

	
	public ArrayList<Qna> askToAdminList(PageInfo pi, int userNo) {
		Connection conn = getConnection();
		
		ArrayList<Qna> list  = new MemBoardDao().askToAdminList(conn, pi, userNo);

		close(conn);
		
		return list;
	}
	
	
	public Qna askToAdminDetail(int qNo, int userNo) {
		Connection conn = getConnection();
		
		Qna q  = new MemBoardDao().askToAdminDetail(conn, qNo, userNo);

		close(conn);
		
		return q;
	}
	
	public int askToAdminInsert(int userNo, String subject, String title, String content) {
		Connection conn = getConnection();
		int result = new MemBoardDao().askToAdminInsert(conn, userNo, subject, title, content);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 목록 갯수 뽑기
	public int askToPet(int aSitterNo) {
		Connection conn = getConnection();
		int listCount = new MemBoardDao().askToPet(conn, aSitterNo);
		close(conn);
		return listCount;
	}
	
	// qna 전체 조회
	public ArrayList<MemBoard> selectAsktoPet(PageInfo pi, int aSitterNo){
		Connection conn = getConnection();
		ArrayList<MemBoard> list = new MemBoardDao().selectAsktoPet(conn, pi, aSitterNo);
		
		close(conn);
		return list;
	}
	
	// qna 상세 조회
	public Qna askToPetDetail(int qno) {
		Connection conn = getConnection();
		Qna q  = new MemBoardDao().askToPetDetail(conn, qno);
		
		close(conn);
		return q;
	}
	
	public int askPetSitterInsert(int userNo, String title, String content) {
		Connection conn = getConnection();
		int result = new MemBoardDao().askPetSitterInsert(conn, userNo, title, content);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	
	
	}
	

}
