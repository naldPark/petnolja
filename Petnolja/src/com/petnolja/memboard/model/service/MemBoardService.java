package com.petnolja.memboard.model.service;

import static com.petnolja.common.JDBCTemplate.*;

import java.sql.Connection;

import com.petnolja.memboard.model.dao.MemBoardDao;


public class MemBoardService {

	
	public int askToAdminList() {
		Connection conn = getConnection();
		
		int result = new MemBoardDao().askToAdminList(conn);

		close(conn);
		return result;
	}
	

}
