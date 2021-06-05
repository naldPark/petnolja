package com.petnolja.board.model.service;

import static com.petnolja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.board.model.dao.BoardDao;
import com.petnolja.board.model.vo.MemNotice;

public class BoardService {
	


	public ArrayList<MemNotice> memFaqList() {

		Connection conn = getConnection();
		
		ArrayList<MemNotice> list = new BoardDao().faqList(conn);

		close(conn);
		
		return list;

	}

}
