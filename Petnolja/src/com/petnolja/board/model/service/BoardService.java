package com.petnolja.board.model.service;

import static com.petnolja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.board.model.dao.BoardDao;
import com.petnolja.board.model.vo.MemNotice;
import com.petnolja.common.model.vo.PageInfo;

public class BoardService {
	
	
	
	
	public int memFaqCount() {
		Connection conn = getConnection();
		int result = new BoardDao().memFaqCount(conn);
		

		close(conn);
		return result;
	}
		

	public ArrayList<MemNotice> memFaqList(PageInfo pi) {

		Connection conn = getConnection();
		
		ArrayList<MemNotice> list = new BoardDao().faqList(conn, pi);

		close(conn);
		
		return list;

	}

}
