package com.petnolja.memboard.model.service;

import static com.petnolja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.memboard.model.dao.MemBoardDao;
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
	

}
